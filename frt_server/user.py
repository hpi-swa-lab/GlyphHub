from sqlalchemy import Column, ForeignKey, String, Text
from sqlalchemy.orm import relationship
from sqlalchemy.orm import column_property, relationship, validates

from frt_server.common import CommonColumns
import frt_server.config

import hashlib
import string
import random

from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import SignatureExpired, BadSignature


class User(CommonColumns):
    __tablename__ = 'user'
    username = Column(String(120))
    password = Column(String(120))
    salt = Column(String(120))
    fonts = relationship('Font', back_populates='author')
    attachments = relationship('Attachment', back_populates='owner')
    thread_subscriptions = relationship('ThreadSubscription', back_populates='user')

    def generate_auth_token(self, expiration=frt_server.config.TOKEN_EXPIRATION):
        """Generates token for given expiration
        and user login."""
        s = Serializer(frt_server.config.SECRET_KEY, expires_in=expiration)
        return s.dumps({'username': self.username })

    @staticmethod
    def verify_auth_token(token):
        """Verifies token and eventually returns
        user login.
        """
        s = Serializer(frt_server.config.SECRET_KEY)
        try:
            data = s.loads(token)
        except SignatureExpired:
            return None # valid token, but expired
        except BadSignature:
            return None # invalid token
        return data['username']

    def is_authorized(self, role_names):
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
        """Encrypt password using hashlib and current salt.
        """
        return str(hashlib.sha1((password + str(self.salt)).encode('utf-8')).hexdigest())

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
