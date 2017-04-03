import os
from eve import Eve

from eve.auth import TokenAuth
from eve_sqlalchemy import SQL

import copy

import frt_server.tables
from frt_server.routes import register_routes

class TokenAuth(TokenAuth):
    app = None

    def check_auth(self, token, allowed_roles, resource, method):
        """
        First we are verifying if the token is valid.
        """

        login_name = frt_server.tables.User.verify_auth_token(token)
        if login_name:
            db_session = self.app.data.driver.session
            users = db_session.query(frt_server.tables.User).filter_by(user_name = login_name).all()
            if not users:
                return False
            user = users[0]
            self.set_request_auth_value(user)
            return user.isAuthorized(allowed_roles)
        else:
            return False

def setup_database(app, populate_sample_data=True):
    db = app.data.driver
    frt_server.tables.Base.metadata.bind = db.engine
    db.Model = frt_server.tables.Base
    db.create_all()

    if populate_sample_data and db.session.query(frt_server.tables.User).count() < 1:
        from frt_server.seed import entities
        for entity in copy.deepcopy(entities):
            db.session.add(entity)
        db.session.commit()

def create_app():
    app = Eve(data = SQL, auth=TokenAuth)
    app.auth.app = app
    register_routes(app)
    return app

