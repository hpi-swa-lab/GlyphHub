from frt_server.tests import TestMinimal
from frt_server.tables import Family, Font

from sqlalchemy.orm import joinedload

import os
import time

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

    def asynchronous_upload(self, family_id, filename, expecting_error = False):
        data, status = self.upload_file('/family/{}/upload'.format(family_id), 'file', filename)
        self.assertEqual(status, 200)

        data, _ = self.get('/family/{}/status'.format(family_id))
        self.assertEqual(data['status'], 'processing')
        self.assertIsNone(data['error'])

        # continously poll our upload service until processing finished
        while data['status'] == 'processing':
            time.sleep(0.1)
            data, _ = self.get('/family/{}/status'.format(family_id))

        self.assertEqual(data['status'], 'ready_for_upload')

        if expecting_error:
            self.assertIsNotNone(data['error'])
        else:
            self.assertIsNone(data['error'])

    def test_upload_glyphs(self):
        self.asynchronous_upload(self.family_id, 'testFiles/RiblonSans/RiblonSans.glyphs')

        family = self.get_test_family()
        self.assertTrue(os.path.exists(family.source_folder_path()))

        for font in family.fonts:
            self.assertTrue(os.path.exists(font.folder_path()))
            self.assertTrue(os.path.exists(font.ufo_folder_path()))
            self.assertTrue(os.path.exists(font.otf_folder_path()))
            self.assertTrue(os.path.exists(os.path.join(font.ufo_folder_path(), 'RiblonSans-Regular.ufo')))
            self.assertTrue(os.path.exists(os.path.join(font.otf_folder_path(), 'RiblonSans-Regular.otf')))

    def test_upload_ufo(self):
        self.asynchronous_upload(self.family_id, 'testFiles/RiblonSans/RiblonSans.ufo.zip')

        family = self.get_test_family()
        for font in family.fonts:
            self.assertTrue(os.path.exists(font.folder_path()))
            self.assertTrue(os.path.exists(font.ufo_folder_path()))
            self.assertTrue(os.path.exists(font.otf_folder_path()))
            self.assertTrue(os.path.exists(os.path.join(font.ufo_folder_path(), 'RiblonSans.ufo')))
            self.assertTrue(os.path.exists(os.path.join(font.otf_folder_path(), 'RiblonSans-Regular.otf')))

    def test_upload_invalid_file(self):
        self.asynchronous_upload(self.family_id, 'testFiles/RiblonSans/RiblonSans-broken.glyphs', True)
        # when launching a new attempt with a working family, we verify that the error is reset
        self.asynchronous_upload(self.family_id, 'testFiles/RiblonSans/RiblonSans.glyphs', False)

    def test_upload_invalid_new_version(self):
        self.asynchronous_upload(self.family_id, 'testFiles/RiblonSans/RiblonSans.glyphs', False)
        self.asynchronous_upload(self.family_id, 'testFiles/RiblonSans/RiblonSans-broken.glyphs', True)

        self.assertIsNotNone(self.connection.session.query(Family).get(self.family_id))

        family = self.get_test_family()
        self.assertEqual(len(family.fonts), 1)

    def test_upload_ufo_with_whitespace_in_filename(self):
        self.asynchronous_upload(self.family_id, 'testFiles/Riblon Sans/Riblon Sans 42.ufo.zip')

        family = self.get_test_family()
        for font in family.fonts:
            self.assertTrue(os.path.exists(font.folder_path()))
            self.assertTrue(os.path.exists(font.ufo_folder_path()))
            self.assertTrue(os.path.exists(font.otf_folder_path()))
            self.assertTrue(os.path.exists(os.path.join(font.ufo_folder_path(), 'Riblon_Sans_42.ufo')))
            self.assertTrue(os.path.exists(os.path.join(font.otf_folder_path(), 'RiblonSans-Regular.otf')))
