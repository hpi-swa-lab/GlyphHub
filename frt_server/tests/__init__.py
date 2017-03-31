import os
import unittest
import tempfile
import eve.tests
import json
from eve_sqlalchemy import SQL
from eve_sqlalchemy.validation import ValidatorSQL

from frt_server.run import create_app, setup_database

class TestMinimal(eve.tests.TestMinimal):
    def setUp(self):
        self.this_directory = os.path.dirname(os.path.realpath(__file__))

        self.app = create_app()
        self.setupDB()
        self.test_client = self.app.test_client()
        self.cachedApiToken = None

        self.domain = self.app.config['DOMAIN']

    def tearDown(self):
        del self.app
        self.dropDB()

    def setupDB(self):
        self.connection = self.app.data.driver
        self.connection.session.execute('pragma foreign_keys=on')
        setup_database(self.app)

    def dropDB(self):
        self.connection.session.remove()
        self.connection.drop_all()

    def get(self, url):
        headers = [
            ('Content-Type', 'application/json'),
            ('Authorization', self.cachedApiToken)
        ]
        response = self.test_client.get(url, headers=headers)
        return self.parse_response(response)

    def login_as(self, userName, password):
        data, status = self.login('Eva', 'eveisevil')
        assert status == 200
        self.cachedApiToken = data['token']
        return data, status

    def login(self, userName, password):
        return self.post('/login', dict(userName=userName, password=password))

