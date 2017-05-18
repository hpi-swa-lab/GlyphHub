from frt_server.tests import TestMinimal

from frt_server.tables import Family, Font

from sqlalchemy.orm import joinedload

GIT_COMMIT_HASH_LENGHT = 40

class VersionsTestCase(TestMinimal):

    def setUp(self):
        super(VersionsTestCase, self).setUp()
        self.login_as('eve@evil.com', 'eveisevil')

        family = Family(family_name='Riblon')

        session = self.connection.session
        session.add(family)
        session.commit()

        self.family_id = family._id

        self.upload_glyphs_file()

    def get_test_family(self):
        return self.connection.session.query(Family).options(joinedload(Family.fonts)).get(self.family_id)

    def upload_glyphs_file(self, message=None, version=''):
        data, status = self.upload_file('/family/{}/upload'.format(self.family_id),
                'file',
                'testFiles/RiblonSans/RiblonSans{}.glyphs'.format(version),
                {'commit_message': message})
        self.assertEqual(status, 200)
        return data, status

    def testUploadCreatesNoDuplicates(self):
        self.upload_glyphs_file(None, '-v2')
        self.assertEqual(len(self.get_test_family().fonts), 1)

    def testSingleVersion(self):
        family = self.get_test_family()
        self.assertEqual(len(family.fonts), 1)
        self.assertEqual(len(family.versions()), 1)
        self.assertEqual(len(family.versions()[0]['version_hash']), GIT_COMMIT_HASH_LENGHT)

    def testMultipleVersions(self):
        self.upload_glyphs_file(None, '-v2')

        family = self.get_test_family()
        self.assertEqual(len(family.fonts), 1)
        self.assertEqual(len(family.versions()), 2)
        for i in range(0, 2):
            self.assertEqual(len(family.versions()[i]['version_hash']), GIT_COMMIT_HASH_LENGHT)

    def testCommitMessage(self):
        MESSAGE = 'My newest version!'
        self.upload_glyphs_file(MESSAGE, '-v2')
        self.assertEqual(self.get_test_family().versions()[0]['message'], MESSAGE)

    def testCommitContents(self):
        A_PREFIX = '<?xml version="1.0" encoding="UTF-8"?>\n<glyph name="A" format="2">'

        family = self.get_test_family()
        font = family.fonts[0]
        version = family.versions()[0]['version_hash']

        # try accessing expected files. will throw an error if they don't exist.
        font.versioned_file_at_path('ufo/RiblonSans-Regular.ufo/fontinfo.plist', version)

        a = font.versioned_file_at_path('ufo/RiblonSans-Regular.ufo/glyphs/A_.glif', version)
        self.assertTrue(str(a, 'utf-8').startswith(A_PREFIX))

        with self.assertRaises(FileNotFoundError):
            font.versioned_file_at_path('ufo/doesntexist', version)

