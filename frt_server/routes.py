import json
import os
import base64
import re
import glob
from functools import wraps

from flask import request, jsonify, current_app, send_from_directory, Response
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
        if 'file' not in request.files:
            return jsonify({'error': 'No file given'}), 400
   
        family_file = request.files['file']
        if family_file.filename == '':
            return jsonify({'error': 'Invalid file given'}), 400

        if not re.match(r"^.*(\.ufo\.zip|\.glyphs)$", family_file.filename):
            return jsonify({'error': 'Invalid file format'}), 400

        session = app.data.driver.session
        family = session.query(Family).get(family_id)
        if not family:
            return jsonify({'error': 'Associated family does not exist'}), 400

        family.process_file(family_file, current_user, request.form.get('commit_message') or 'New Version')
        return '', 200

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
            contents = font.get_otf_contents()
        except FileNotFoundError:
            return jsonify({'error': 'Associated font does not contain an otf'})

        response = Response(contents, mimetype='application/octet-stream')
        response.headers["Content-Disposition"] = "attachment; filename=font.otf"
        return response



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

    if frt_server.config.DEBUG:
        @app.before_request
        def before():
            if frt_server.config.REQUEST_DEBUG:
                print(request.headers)
                print(request.get_data())

        @app.after_request
        def after(response):
            if frt_server.config.RESPONSE_DEBUG:
                print(response.status)
                print(response.headers)
                print(response.data)
            return response
