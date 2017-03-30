import sys
if sys.version_info < (3, 0):
    sys.stdout.write("Sorry, requires Python 3.x, not Python 2.x\n")
    sys.exit(1)

import os
from eve import Eve

from eve.auth import TokenAuth
from eve_sqlalchemy import SQL

import tables
from views import register_views

class TokenAuth(TokenAuth):
    def check_auth(self, token, allowed_roles, resource, method):
        """
        First we are verifying if the token is valid.
        """

        login_name = tables.User.verify_auth_token(token)
        if login_name:
            users = app.data.driver.session.query(tables.User).filter_by(user_name = login_name).all()
            if not users:
                return False
            user = users[0]
            return user.isAuthorized(allowed_roles)
        else:
            return False

app = Eve(data = SQL, auth=TokenAuth)

db = app.data.driver
tables.Base.metadata.bind = db.engine
db.Model = tables.Base
db.create_all()

if not db.session.query(tables.User).count():
    from seed import entities
    for entity in entities:
        db.session.add(entity)
    db.session.commit()

if __name__ == '__main__':
    register_views(app)
    app.run(debug = True, port = 8000)
