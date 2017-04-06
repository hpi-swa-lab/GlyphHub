import json
import os
import base64
import re
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
    @requires_auth('font')
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

        family.process_file(family_file, current_user)
        return '', 200

    @app.route('/font/<font_id>/convert', methods=['POST'])
    def convert_unicode(font_id):
        session = app.data.driver.session
        font = session.query(Font).get(font_id)
        if not font:
            return jsonify({'error': 'Associated font does not exist'}), 400

        data = request.get_json()
        unicode_text = data.get('unicode')
        if unicode_text == None:
            return jsonify({'error': 'No unicode text provided'}), 400
        if len(unicode_text) < 1:
            return jsonify([])

        return Response(json.dumps(font.convert(unicode_text)),
                mimetype='application/json')

    @app.route('/font/<font_id>/ufo', methods=['GET'])
    def retrieve_ufo(font_id):
        session = app.data.driver.session
        font = session.query(Font).get(font_id)
        if not font:
            return jsonify({'error': 'Associated font does not exist'}), 400

        requested_data = json.loads(request.args.get('query'))
        response = font.get_ufo_data(requested_data)

        return jsonify(response), 200 

    @app.route('/snap', methods=['GET'])
    def attachment_upload_view():
        directory = os.path.join(frt_server.config.BASE, '..', 'frt_server', 'static')
        return send_from_directory(directory, 'snap.html')

    @app.route('/attachment/upload', methods=['POST'])
    @frt_requires_auth('resource', 'attachment')
    def attachment_upload(resource):
        session = app.data.driver.session
        user = app.auth.get_request_auth_value()

        attachment_file = request.files['file']
        if attachment_file.filename == '':
            return jsonify({'error': 'Invalid file given'}), 400

        name = secure_filename(os.path.basename(attachment_file.filename))
        file_type = name.rsplit('.', 1)[-1].lower()

        if file_type in ('jpg', 'jpeg', 'png', 'gif'):
            attachment_type = AttachmentType.picture
        else:
            attachment_type = AttachmentType.file

        attachment = Attachment(owner_id=user._id, type=attachment_type, data1=name)
        session.add(attachment)
        session.commit()
        session.refresh(attachment)

        attachment.clean_folder()
        attachment.ensure_folder_exists()
        attachment_file.save(attachment.file_path())

        return jsonify(sqla_object_to_dict(attachment, Attachment.__table__.columns.keys()))

    @app.before_request
    def before():
        if frt_server.settings.REQUEST_DEBUG:
            print(request.headers)
            print(request.get_data())

    @app.after_request
    def after(response):
        if frt_server.settings.RESPONSE_DEBUG:
            print(response.status)
            print(response.headers)
            print(response.data)
        return response
