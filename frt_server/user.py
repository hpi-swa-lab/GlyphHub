from sqlalchemy import Column, ForeignKey, String, Text
from sqlalchemy.orm import relationship
from sqlalchemy.orm import column_property, relationship, validates

from frt_server.common import CommonColumns
import frt_server.config

import hashlib
import string
import random
import os

from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import SignatureExpired, BadSignature
from PIL import Image, ImageOps


class User(CommonColumns):
    __tablename__ = 'user'
    username = Column(String(120))
    password = Column(String(120))
    email = Column(String(120))
    salt = Column(String(120))
    fonts = relationship('Font', back_populates='author')
    attachments = relationship('Attachment', back_populates='owner')
    thread_subscriptions = relationship('ThreadSubscription', back_populates='user')

    def avatar_file_path(self):
        return os.path.join(frt_server.config.AVATAR_UPLOAD_FOLDER, str(self._id)) + '.jpg'

    def get_avatar_path(self):
        if os.path.exists(self.avatar_file_path()):
            return self.avatar_file_path()
        else:
            return os.path.join(frt_server.config.MEDIA_FOLDER, 'default_avatar.jpg')

    def clean_avatar_file(self):
        if os.path.exists(self.avatar_file_path()):
            os.remove(self.avatar_file_path())

    def ensure_avatar_folder_exists(self):
        if not os.path.exists(frt_server.config.AVATAR_UPLOAD_FOLDER):
            os.makedirs(frt_server.config.AVATAR_UPLOAD_FOLDER)

    def convert_and_save_image(self, image_file):
        size = (128, 128)
        try:
            image = Image.open(image_file.stream)
            fitted_image = ImageOps.fit(image, size)
            fitted_image.save(self.avatar_file_path())
        except IOError:
           return jsonify({'error': 'Converting file failed'}), 500

    def generate_auth_token(self, expiration=frt_server.config.TOKEN_EXPIRATION):
        """Generates token for given expiration
        and user login."""
        s = Serializer(frt_server.config.SECRET_KEY, expires_in=expiration)
        return s.dumps({'email': self.email })

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
        return data['email']

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
