import json
import os
import base64
import re
import datetime
from functools import wraps

from flask import request, jsonify, current_app, send_from_directory, Response, send_file
from werkzeug.exceptions import Unauthorized
from werkzeug.utils import secure_filename
from eve.auth import requires_auth
from eve_sqlalchemy import sqla_object_to_dict

from frt_server.tables import User, Font, Family, Attachment, AttachmentType
import frt_server.config
import frt_server.font
import frt_server.settings

def frt_requires_auth(endpoint_class, resource):
    def fdec(f):
        @wraps(f)
        def auth():
            return requires_auth(endpoint_class)(f)(resource)
        return auth
    return fdec

def register_routes(app):
    @app.route('/login', methods=['POST'])
    def login(**kwargs):
        """Simple login view that expects to have username
        and password in the request POST. If the username and
        password matches - token is generated and returned.
        """
        data = request.get_json()
        if not data:
            return jsonify({'error': 'Missing credentials'}), 400

        username = data.get('username')
        password = data.get('password')

        if not username or not password:
            raise Unauthorized('Missing username and/or password.')
        else:
            users = app.data.driver.session.query(User).filter_by(username = username).all()
            if users and users[0].check_password(password):
                token = users[0].generate_auth_token()
                return jsonify({'token': token.decode('ascii'), 'user_id': users[0]._id})
        raise Unauthorized('Wrong username and/or password.')

    @app.route('/family/<family_id>/upload', methods=['POST'])
    @requires_auth('')
    def upload_family(family_id):
        current_user = current_app.auth.get_request_auth_value()
        session = app.data.driver.session

        family = session.query(Family).get(family_id)
        if not family:
            return jsonify({'error': 'Associated family does not exist'}), 400

        try:
            if 'file' not in request.files:
                return jsonify({'error': 'No file given'}), 400

            family_file = request.files['file']
            if family_file.filename == '':
                return jsonify({'error': 'Invalid file given'}), 400

            if not re.match(r"^.*(\.ufo\.zip|\.glyphs)$", family_file.filename):
                return jsonify({'error': 'Invalid file format'}), 400

            try:
                family.process_file(family_file, current_user, request.form.get('commit_message') or 'New Version')
                return '', 200
            except Exception:
                return jsonify({'error': 'Processing file failed'}), 400
        finally:
            Family.delete_family_if_empty(family)

    @app.route('/font/<font_id>/convert', methods=['POST'])
    @requires_auth('')
    def convert_unicode(font_id):
        session = app.data.driver.session
        font = session.query(Font).get(font_id)
        if not font:
            return jsonify({'error': 'Associated font does not exist'}), 400

        data = request.get_json()
        if not data:
            return jsonify({'error': 'No unicode text provided'}), 400
        unicode_text = data.get('unicode')
        if unicode_text == None:
            return jsonify({'error': 'No unicode text provided'}), 400
        if len(unicode_text) < 1:
            return jsonify([])

        return Response(json.dumps(font.convert(unicode_text)),
                mimetype='application/json')

    @app.route('/font/<font_id>/otf', methods=['GET'])
    @requires_auth('')
    def retrieve_otf(font_id):
        session = app.data.driver.session
        font = session.query(Font).get(font_id)
        if not font:
            return jsonify({'error': 'Associated font does not exist'}), 400

        try:
            otf = open(font.otf_file_path())
        except FileNotFoundError:
            return jsonify({'error': 'Associated font does not contain an otf'}), 400

        return send_file(font.otf_file_path(), mimetype='application/octet-stream', as_attachment=True)

    @app.route('/font/<font_id>/ufo', methods=['GET'])
    @requires_auth('')
    def retrieve_ufo(font_id):
        session = app.data.driver.session
        font = session.query(Font).get(font_id)
        if not font:
            return jsonify({'error': 'Associated font does not exist'}), 400

        query_parameter = request.args.get('query')
        if query_parameter == None:
            return jsonify({'error': 'No query specified'}), 400
        try:
            requested_data = json.loads(query_parameter)
        except json.JSONDecodeError:
            return jsonify({'error': 'Invalid query'}), 400
        response = font.get_ufo_data(requested_data)

        return jsonify(response), 200

    @app.route('/snap', methods=['GET'])
    def attachment_upload_view():
        directory = os.path.join(frt_server.config.BASE, '..', 'frt_server', 'static')
        return send_from_directory(directory, 'snap.html')

    def _upload_attachment(comment_id=None):
        """helper that uploads an attachment from the file field"""
        session = app.data.driver.session
        user = app.auth.get_request_auth_value()
        if 'file' not in request.files:
            return jsonify({'error': 'No file given'}), 400

        attachment_file = request.files['file']
        if attachment_file.filename == '':
            return jsonify({'error': 'Invalid filename'}), 400

        filename = secure_filename(os.path.basename(attachment_file.filename))
        file_type = filename.rsplit('.', 1)[-1].lower()

        if file_type in ('jpg', 'jpeg', 'png', 'gif'):
            attachment_type = AttachmentType.picture
        else:
            attachment_type = AttachmentType.file

        attachment = Attachment(owner_id=user._id, type=attachment_type, data1=filename, comment_id=comment_id)
        session.add(attachment)
        session.commit()
        session.refresh(attachment)

        attachment.clean_folder()
        attachment.ensure_folder_exists()
        attachment_file.save(attachment.file_path())

        return jsonify(sqla_object_to_dict(attachment, Attachment.__table__.columns.keys()))

    def _upload_avatar():
        """helper that uploads a user avatar from the file field"""
        session = app.data.driver.session
        user = app.auth.get_request_auth_value()
        if 'file' not in request.files:
            return jsonify({'error': 'No file given'}), 400

        avatar_file = request.files['file']
        if avatar_file.filename == '':
            return jsonify({'error': 'Invalid filename'}), 400

        filename = secure_filename(os.path.basename(avatar_file.filename))
        file_type = filename.rsplit('.', 1)[-1].lower()
        if file_type not in ('jpg', 'jpeg', 'png', 'gif'):
            return jsonify({'error': 'Invalid file type'}), 400

        user.clean_avatar_file()
        user.ensure_avatar_folder_exists()

        user.convert_and_save_image(avatar_file)

        user.updated_at = datetime.datetime.now()
        session.commit()
        return jsonify(), 200

    @app.route('/comment/<comment_id>/attachment', methods=['POST'])
    @requires_auth('')
    def comment_attach(comment_id):
        """attach an attachment to a comment"""
        return _upload_attachment(comment_id)

    @app.route('/attachment/upload', methods=['POST'])
    @requires_auth('')
    def attachment_upload():
        """upload an attachment that does not have an associated comment"""
        return _upload_attachment()

    @app.route('/attachment/<attachment_id>/resource', methods=['GET'])
    @requires_auth('')
    def attachment_download(attachment_id):
        session = app.data.driver.session
        attachment = session.query(Attachment).get(attachment_id)
        if not attachment:
            return jsonify({'error': 'Attachment does not exist'})
        return send_from_directory(attachment.folder_path(), attachment.data1)
    
    @app.route('/user_avatar/upload', methods=['POST'])
    @requires_auth('')
    def user_avatar_upload():
        """upload a new user avatar for the currently logged in user"""
        return _upload_avatar()

    @app.route('/user_avatar/<user_id>', methods=['GET'])
    @requires_auth('')
    def user_avatar_download(user_id):
        """download the user avatar for the given user"""
        session = app.data.driver.session
        user = session.query(User).get(user_id)
        if not user:
            return jsonify({'error': 'Associated user does not exist'}), 400

        try:
            image_path = user.get_avatar_path()
        except FileNotFoundError:
            return jsonify({'error': 'No default image found'}), 500

        return send_file(image_path, mimetype='image/jpeg', as_attachment=True)

    if frt_server.config.DEBUG:
        @app.before_request
        def before():
            if frt_server.config.REQUEST_DEBUG:
                print('\n\n\n\n\033[33m-------------------------------------------------\033[0m')
                print('\033[33mREQUEST {} {}:\033[0m'.format(request.method, request.full_path))
                print(request.headers)
                print(str(request.get_data())[0:frt_server.config.DATA_PRINT_LIMIT])

        @app.after_request
        def after(response):
            if frt_server.config.RESPONSE_DEBUG:
                print('\033[31mRESPONSE:\033[0m')
                print(response.status)
                print(response.headers)
                if not response.direct_passthrough:
                    print(str(response.data)[0:frt_server.config.DATA_PRINT_LIMIT])
                print('\033[31m-------------------------------------------------\033[0m')
            return response
