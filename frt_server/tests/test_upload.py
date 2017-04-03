from frt_server.tests import TestMinimal
import os

class UploadTestCase(TestMinimal):
    def setUp(self):
        super(UploadTestCase, self).setUp()
        self.login_as('Eva', 'eveisevil')

    #def test_upload_glyphs(self):
        #data, status = self.upload_file('/family/1/upload', 'file', 'martel/Martel Source Files/Martel 20150421.glyphs')
        #self.assertEqual(status, 200)

    def test_upload_ufo(self):
        data, status = self.upload_file('family/1/upload', 'file', 'testFiles/Martel-Bold.ufo.zip')
        self.assertEqual(status, 200)

        self.assertTrue(os.path.exists('frt_server/uploads/font/2/ufo/'))
