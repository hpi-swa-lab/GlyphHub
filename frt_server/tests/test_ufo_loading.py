from frt_server.tests import TestMinimal
from frt_server.tables import Family, Font

from sqlalchemy.orm import joinedload

import json
import os

class UfoLoadingTestCase(TestMinimal):
    def setUp(self):

        super().setUp()

        self.login_as('Eva', 'eveisevil')

        family = Family(family_name='Riblon')

        session = self.connection.session
        session.add(family)
        session.commit()
        session.refresh(family)

        self.family_id = family._id

        data, status = self.upload_file('/family/{}/upload'.format(self.family_id), 'file', 'testFiles/RiblonSans/RiblonSans.ufo.zip')
        self.assertEqual(status, 200)

        #session.refresh(family)
        family = session.query(Family).get(self.family_id)
        self.font_id = family.fonts[0]._id

    def helper_send_query(self, query_json):
        query = json.dumps(query_json)
        data, status = self.get('/font/{}/ufo?query={}'.format(self.font_id, query))
        self.assertEqual(status, 200)

        # make sure we actually have data
        self.assertIsNotNone(data)
        return data

    def helper_check_glif_contents(self, glifs):
        self.assertIsNotNone(glifs)

        self.assertTrue('A_' in glifs)
        self.assertTrue(glifs['A_'].startswith('<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<glyph name="A" format="2">'))
        self.assertTrue('s' in glifs)
        self.assertTrue(glifs['s'].startswith('<?xml version="1.0" encoding="UTF-8"?>\n' +
            '<glyph name="s" format="2">'))

    def helper_check_fontinfo(self, fontinfo):
        self.assertIsNotNone(fontinfo)
        self.assertTrue('ascender' in fontinfo)
        self.assertEqual(fontinfo["ascender"], 800)
        self.assertTrue('unitsPerEm' in fontinfo)
        self.assertEqual(fontinfo["unitsPerEm"], 1000)
        # our plist SHOULD contain 26 different entries
        self.assertEqual(len(fontinfo), 26)

    def test_load_contents_plist(self):
        data = self.helper_send_query({"glyphs": None})

        glyphs = data['glyphs']
        self.assertIsNotNone(glyphs)

        self.assertEqual(glyphs, {"A": "A_.glif", "a": "a.glif", "s": "s.glif", "space": "space.glif"})
        # our plist SHOULD contain 4 different entries
        self.assertEqual(len(glyphs), 4)

    def test_get_fontinfo_plist(self):
        data = self.helper_send_query({"fontinfo": None})
        self.helper_check_fontinfo(data['fontinfo'])

#    TODO
#    def test_get_ufo(self):
#        data, status = self.get('font/{}/ufo/')

    def test_get_glifs(self):
        data = self.helper_send_query({"glifs": ['A_', 's']})
        self.helper_check_glif_contents(data['glifs'])

    def test_get_glifs_and_fontinfo(self):
        data = self.helper_send_query({"fontinfo": None, "glifs": ['A_', 's']})
        self.helper_check_glif_contents(data['glifs'])
        self.helper_check_fontinfo(data['fontinfo'])
