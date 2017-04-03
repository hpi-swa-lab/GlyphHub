from frt_server.tests import TestMinimal
from frt_server.tables import Family, Font

from sqlalchemy.orm import joinedload

import os

class UploadTestCase(TestMinimal):
    def setUp(self):
        super(UploadTestCase, self).setUp()
        self.login_as('Eva', 'eveisevil')

    def test_upload_glyphs(self):
        FAMILY_ID = 1
        data, status = self.upload_file('/family/{}/upload'.format(FAMILY_ID), 'file', 'testFiles/RiblonSans/RiblonSans.glyphs')
        self.assertEqual(status, 200)

        family = self.connection.session.query(Family).options(joinedload(Family.fonts)).get(FAMILY_ID)
        self.assertTrue(os.path.exists(family.sourceFolderPath()))

        #for font in family.fonts:
            #self.assertTrue(os.path.exists(font.sourceFolderPath()))

    def test_upload_ufo(self):
        pass

