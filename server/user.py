from common import CommonColumns
from sqlalchemy import Column, ForeignKey, String, Text
from sqlalchemy.orm import relationship
from sqlalchemy.orm import column_property, relationship, validates

import hashlib
import string
import random

from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import SignatureExpired, BadSignature

SECRET_KEY = 'this-is-my-super-secret-key'

class User(CommonColumns):
    __tablename__ = 'user'
    user_name = Column(String(120))
    password = Column(String(120))
    fonts = relationship('Font', back_populates='author')

    def generate_auth_token(self, expiration=24*60*60):
        """Generates token for given expiration
        and user login."""
        s = Serializer(SECRET_KEY, expires_in=expiration)
        return s.dumps({'user_name': self.user_name })

    @staticmethod
    def verify_auth_token(token):
        """Verifies token and eventually returns
        user login.
        """
        s = Serializer(SECRET_KEY)
        try:
            data = s.loads(token)
        except SignatureExpired:
            return None # valid token, but expired
        except BadSignature:
            return None # invalid token
        return data['user_name']

    def isAuthorized(self, role_names):
        """We do not use roles at the moment, but in case they are added, they should be validated here"""
        #"""Checks if user is related to given role_names.
        #"""
        #allowed_roles = set([r.id for r in self.roles])\
        #    .intersection(set(role_names))
        #return len(allowed_roles) > 0
        return True

    def generate_salt(self):
        return ''.join(random.sample(string.ascii_letters, 12))

    def encrypt(self, password):
        "we currently store passwords as plain text"
        #"""Encrypt password using hashlib and current salt.
        #"""
        #return str(hashlib.sha1((password + str(self.salt)).encode('utf-8')).hexdigest())
        return password

    @validates('password')
    def _set_password(self, key, value):
        """Using SQLAlchemy validation makes sure each
        time password is changed it will get encrypted
        before flushing to db.
        """
        self.salt = self.generate_salt()
        return self.encrypt(value)

    def check_password(self, password):
        if not self.password:
            return False
        return self.encrypt(password) == self.password
