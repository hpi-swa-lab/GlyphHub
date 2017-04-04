from frt_server.tests import TestMinimal

class LoginTestCase(TestMinimal):
    def test_valid_login(self):
        response = self.login('Eva', 'eveisevil')
        self.assertEqual(response[1], 200)

    def test_invalid_login(self):
        response = self.login('Eva', 'nicetry')
        self.assertEqual(response[1], 401)

    def test_get_font_resource(self):
        self.login_as('Eva', 'eveisevil')
        _, status = self.get('/font')
        self.assertEqual(status, 200)

