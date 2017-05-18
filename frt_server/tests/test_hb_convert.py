from frt_server.tests import TestMinimal
from frt_server.tables import Family, Font

class HbConvertTestCase(TestMinimal):
    def setUp(self):
        """create a family and save its id"""
        super().setUp()
        self.login_as('eve@evil.com', 'eveisevil')

        family = Family(family_name='Riblon')

        self.session = self.connection.session
        self.session.add(family)
        self.session.commit()

        self.family_id = family._id

    def helper_upload_font(self, fonts_file):
        """upload fonts and return the id of the last"""
        _, status = self.upload_file('/family/{}/upload'.format(self.family_id),
                'file',
                fonts_file)
        self.assert200(status)
        family = self.session.query(Family).get(self.family_id)
        return family.fonts[-1]._id

    def helper_convert_sequence(self, fonts_file, text='Aas', result=[['A', 0], ['a', 1], ['s', 2]]):
        """upload the given file, convert a text and assert against the result"""
        font_id = self.helper_upload_font(fonts_file)

        data, status = self.post('font/{}/convert'.format(font_id), {'unicode': text})
        self.assert200(status)
        self.assertIsNotNone(data)
        self.assertCountEqual(data, result)

    def test_convert_sequence_glyphs(self):
        self.helper_convert_sequence('testFiles/RiblonSans/RiblonSans.glyphs')

    def test_convert_sequence_ufo(self):
        self.helper_convert_sequence('testFiles/RiblonSans/RiblonSans.ufo.zip')

    def test_convert_empty_sequence(self):
        self.helper_convert_sequence('testFiles/RiblonSans/RiblonSans.ufo.zip', '', [])

    def test_convert_no_sequence(self):
        font_id = self.helper_upload_font('testFiles/RiblonSans/RiblonSans.glyphs')
        _, status = self.post('font/{}/convert'.format(font_id), {})
        self.assert400(status)

    def test_convert_sequence_with_unknown(self):
        self.helper_convert_sequence('testFiles/RiblonSans/RiblonSans.ufo.zip', 'Aß', [['A', 0], ['.notdef', 1]])
