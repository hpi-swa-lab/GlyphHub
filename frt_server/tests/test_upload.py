from frt_server.tests import TestMinimal

class UploadTestCase(TestMinimal):
    def setUp(self):
        super(UploadTestCase, self).setUp()
        self.login_as('Eva', 'eveisevil')

    def test_upload_glyphs(self):
        data, status = self.upload_file('/family/1/upload', 'file', 'martel/Martel Source Files/Martel 20150421.glyphs',)
        self.assertEqual(status, 200)

    def test_upload_ufo(self):
        pass

