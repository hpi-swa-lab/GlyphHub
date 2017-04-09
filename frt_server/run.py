import os
from eve import Eve

from eve.auth import TokenAuth
from eve_sqlalchemy import SQL
from eve_sqlalchemy.validation import ValidatorSQL

import copy

import frt_server.tables
from frt_server.routes import register_routes

class TokenAuth(TokenAuth):
    app = None

    def check_auth(self, token, allowed_roles, resource, method):
        """
        First we are verifying if the token is valid.
        """

        username = frt_server.tables.User.verify_auth_token(token)
        if username:
            db_session = self.app.data.driver.session
            users = db_session.query(frt_server.tables.User).filter_by(username=username).all()
            if not users:
                return False
            user = users[0]
            self.set_request_auth_value(user)
            return user.is_authorized(allowed_roles)
        else:
            return False

def setup_database(app, populate_sample_data=True):
    db = app.data.driver
    frt_server.tables.Base.metadata.bind = db.engine
    db.Model = frt_server.tables.Base
    db.create_all()

    if populate_sample_data and db.session.query(frt_server.tables.User).count() < 1:
        from frt_server.seed import entities, post_create

        # register new entities
        for entity in entities:
            db.session.add(entity)

        # save and reload new entities
        db.session.flush()
        for entity in entities:
            db.session.refresh(entity)

        # pass them to the post create handler
        for entity in post_create(entities):
            db.session.add(entity)

        db.session.commit()

def create_app():
    app = Eve(data = SQL, auth=TokenAuth, validator=ValidatorSQL)
    app.auth.app = app
    register_routes(app)
    return app

