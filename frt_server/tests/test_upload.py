from frt_server.tests import TestMinimal
from frt_server.tables import Family, Font

from sqlalchemy.orm import joinedload

import os

class UploadTestCase(TestMinimal):
    def setUp(self):
        super(UploadTestCase, self).setUp()
        self.login_as('Eva', 'eveisevil')

        family = Family(family_name='Riblon')

        session = self.connection.session
        session.add(family)
        session.commit()

        self.family_id = family._id

    def get_test_family(self):
        return self.connection.session.query(Family).options(joinedload(Family.fonts)).get(self.family_id)

    def test_upload_glyphs(self):
        data, status = self.upload_file('/family/{}/upload'.format(self.family_id), 'file', 'testFiles/RiblonSans/RiblonSans.glyphs')
        self.assertEqual(status, 200)

        family = self.get_test_family()
        self.assertTrue(os.path.exists(family.source_folder_path()))

        for font in family.fonts:
            self.assertTrue(os.path.exists(font.folder_path()))
            self.assertTrue(os.path.exists(font.ufo_folder_path()))
            self.assertTrue(os.path.exists(font.otf_folder_path()))
            self.assertTrue(os.path.exists(os.path.join(font.ufo_folder_path(), 'RiblonSans-Regular.ufo')))
            self.assertTrue(os.path.exists(os.path.join(font.otf_folder_path(), 'RiblonSans-Regular.otf')))

    def test_upload_ufo(self):
        data, status = self.upload_file('family/{}/upload'.format(self.family_id), 'file', 'testFiles/RiblonSans/RiblonSans.ufo.zip')
        self.assertEqual(status, 200)

        family = self.get_test_family()
        for font in family.fonts:
            self.assertTrue(os.path.exists(font.folder_path()))
            self.assertTrue(os.path.exists(font.ufo_folder_path()))
            self.assertTrue(os.path.exists(font.otf_folder_path()))
            self.assertTrue(os.path.exists(os.path.join(font.ufo_folder_path(), 'RiblonSans.ufo')))
            self.assertTrue(os.path.exists(os.path.join(font.otf_folder_path(), 'RiblonSans-Regular.otf')))

