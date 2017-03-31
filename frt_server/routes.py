import json
import os
import base64
import re

from flask import request, jsonify, current_app
from werkzeug.exceptions import Unauthorized
from eve.auth import requires_auth

from frt_server.tables import User, Font, Family

def register_views(app):
    @app.route('/login', methods=['POST'])
    def login(**kwargs):
        """Simple login view that expects to have username
        and password in the request POST. If the username and
        password matches - token is generated and returned.
        """
        data = request.get_json()
        if not data:
            return jsonify({'error': 'Missing credentials'}), 400

        user_name = data.get('userName')
        password = data.get('password')

        if not user_name or not password:
            raise Unauthorized('Wrong username and/or password.')
        else:
            users = app.data.driver.session.query(User).filter_by(user_name = user_name).all()
            if users and users[0].check_password(password):
                token = users[0].generate_auth_token()
                return jsonify({'token': token.decode('ascii'), 'user_id': users[0]._id})
        raise Unauthorized('Wrong username and/or password.')

    @app.route('/family/<familyId>/upload', methods=['POST'])
    @requires_auth('font')
    def uploadFamily(familyId):
        current_user = current_app.auth.get_request_auth_value()
        if 'file' not in request.files:
            return jsonify({'error': 'No file given'}), 400
   
        familyFile = request.files['file']
        if familyFile.filename == '':
            return jsonify({'error': 'Invalid file given'}), 400

        if not re.match(r"^.*(\.ufo\.zip|\.glyphs)$", familyFile.filename):
            return jsonify({'error': 'Invalid file format'}), 400

        session = app.data.driver.session
        family = session.query(Family).get(familyId)
        if not family:
            return jsonify({'error': 'Associated family does not exist'}), 400

        family.processFile(familyFile, app, current_user)
        return '', 200

    @app.route('/font/<fontId>/convert', methods=['POST'])
    def convertUnicode(fontId):
        session = app.data.driver.session
        font = session.query(Font).get(fontId)
        if not font:
            return jsonify({'error': 'Associated font does not exist'}), 400

        data = request.get_json()
        unicodeText = data.get('unicode')
        if not unicodeText:
            return jsonify({'error': 'No unicode text provided'}), 400
        if not font:
            return jsonify({'error': 'Associated font does not exist'}), 400

        return json.dumps(font.convert(unicodeText)), 200
