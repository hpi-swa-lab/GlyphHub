import json
import base64

from flask import request, jsonify
from werkzeug.exceptions import Unauthorized
from tables import User


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
