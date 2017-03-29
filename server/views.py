import json
import os
import base64
import re

from flask import request, jsonify
from werkzeug.exceptions import Unauthorized
from werkzeug.utils import secure_filename
from eve.auth import requires_auth

from tables import User, Font


def register_views(app):
    @app.route('/login', methods=['POST'])
    def login(**kwargs):
        """Simple login view that expects to have username
        and password in the request POST. If the username and
        password matches - token is generated and returned.
        """
        data = request.get_json()
        user_name = data.get('userName')
        password = data.get('password')

        if not user_name or not password:
            raise Unauthorized('Wrong username and/or password.')
        else:
            users = app.data.driver.session.query(User).filter_by(user_name = user_name).all()
            if users and users[0].check_password(password):
                token = users[0].generate_auth_token()
                return jsonify({'token': token.decode('ascii')})
        raise Unauthorized('Wrong username and/or password.')

    @app.route('/font/<fontId>/upload', methods=['POST'])
    @requires_auth('font')
    def uploadFont(fontId):
        """Upload handler for fonts
        """
        # TODO verify that only the font's author can upload new versions
        # ideally this would happen in our TokenAuth based on the resource
        if 'file' not in request.files:
            return jsonify({'error': 'No file given'}), 400

        fontFile = request.files['file']
        if fontFile.filename == '':
            return jsonify({'error': 'Invalid file given'}), 400

        if not re.match(r"^.*(\.ufo\.zip|\.glyphs)$", fontFile.filename):
            return jsonify({'error': 'Invalid file format'}), 400

        session = app.data.driver.session
        font = session.query(Font).get(fontId)
        if not font:
            return jsonify({'error': 'Associated font does not exist'}), 400

        font.path = secure_filename(fontFile.filename)

        font.ensureSourceFolderExists()
        fontFile.save(font.sourcePath())
        font.convertFontAfterUpload()

        session.commit()

        return '', 200

