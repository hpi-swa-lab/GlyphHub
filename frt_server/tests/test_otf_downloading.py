from frt_server.tests import TestMinimal
from frt_server.tables import Family, Font

from sqlalchemy.orm import joinedload

import json
import os

class OtfDownloadingTestCase(TestMinimal):
    def setUp(self):
        super().setUp()

        self.login_as('eve@evil.com', 'eveisevil')

        family = Family(family_name='Riblon')

        session = self.connection.session
        session.add(family)
        session.commit()
        session.refresh(family)

        self.family_id = family._id

        data, status = self.upload_file('/family/{}/upload'.format(self.family_id), 'file', 'testFiles/RiblonSans/RiblonSans.ufo.zip')
        self.assertEqual(status, 200)

        family = session.query(Family).get(self.family_id)
        self.font_id = family.fonts[0]._id

    def test_download_otf(self):
        session = self.connection.session
        otf_path = session.query(Font).get(self.font_id).otf_file_path()
        with open(otf_path, 'rb') as otf_file:
            otf_contents = otf_file.read()

        response = self.download('/font/{}/otf'.format(self.font_id))

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data, otf_contents)
