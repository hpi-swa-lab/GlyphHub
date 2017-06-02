from frt_server.tests import TestMinimal
from frt_server.tables import User

from sqlalchemy.orm import joinedload

import os

class UploadTestCase(TestMinimal):
    def setUp(self):
        super(UploadTestCase, self).setUp()
        self.login_as('eve@evil.com', 'eveisevil')

        self.session = self.connection.session
        self.user = self.session.query(User).one()

    def test_upload_works(self):
        data, status = self.upload_file('/user_avatar/upload', 'file', 'assets/penguin.png')
        self.assertEqual(status, 200)

    def test_update_at_is_updated(self):
        current = self.user.updated_at
        data, status = self.upload_file('/user_avatar/upload', 'file', 'assets/penguin.png')
        self.assertEqual(status, 200)
        new = self.session.query(User).one().updated_at
        self.assertGreater(new, current)
