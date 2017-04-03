import os
import unittest
import tempfile
import eve.tests
import json
import shutil
from eve_sqlalchemy import SQL
from eve_sqlalchemy.validation import ValidatorSQL

os.environ['FRT_TESTING'] = '1'

import frt_server.config
from frt_server.run import create_app, setup_database

class TestMinimal(eve.tests.TestMinimal):
    def setUp(self):
        self.this_directory = os.path.dirname(os.path.realpath(__file__))

        self.app = create_app()
        self.setupDatabase()
        self.test_client = self.app.test_client()
        self.cachedApiToken = None

        self.domain = self.app.config['DOMAIN']

    def tearDown(self):
        if os.path.exists(frt_server.config.UPLOAD_FOLDER):
            shutil.rmtree(frt_server.config.UPLOAD_FOLDER)
        self.dropDatabase()
        del self.app

    def setupDatabase(self):
        self.connection = self.app.data.driver
        setup_database(self.app)

    def dropDatabase(self):
        self.connection.session.remove()
        self.connection.drop_all()

    def get(self, url):
        headers = [
            ('Content-Type', 'application/json'),
            ('Authorization', self.cachedApiToken)
        ]
        response = self.test_client.get(url, headers=headers)
        return self.parse_response(response)

    def post(self, url, data):
        """post data as a json object to url"""
        headers = [
            ('Content-Type', 'application/json'),
            ('Authorization', self.cachedApiToken)
        ]
        response = self.test_client.post(url, data=json.dumps(data), headers=headers)
        return self.parse_response(response)

    def upload_file(self, url, field_name, path):
        """upload file in a multipart/form-data request with field_name. path is relative
        to project root"""
        with open(os.path.join(self.this_directory, '..', '..', path), 'rb') as f:
            response = self.test_client.post(url,
                    headers=[
                        ('Content-Type', 'multipart/form-data'),
                        ('Authorization', self.cachedApiToken)
                    ],
                    data={field_name: f})
            return self.parse_response(response)

    def login_as(self, userName, password):
        """save the auth token from the given user for all future requests"""
        data, status = self.login('Eva', 'eveisevil')
        assert status == 200
        self.cachedApiToken = data['token']
        return data, status

    def logout(self):
        """not an actual request, just resets the cached token"""
        self.cachedApiToken = None

    def login(self, userName, password):
        return self.post('/login', dict(userName=userName, password=password))

