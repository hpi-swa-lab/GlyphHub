from frt_server.tests import TestMinimal
from sqlalchemy import func
from frt_server.tables import User

class LoginTestCase(TestMinimal):
    def test_valid_login(self):
        response = self.login('eve@evil.com', 'eveisevil')
        self.assertEqual(response[1], 200)

    def test_invalid_login(self):
        response = self.login('eve@evil.com', 'nicetry')
        self.assertEqual(response[1], 401)

    def test_get_font_resource(self):
        self.login_as('eve@evil.com', 'eveisevil')
        _, status = self.get('/font')
        self.assertEqual(status, 200)

    def test_register_new_user(self):
        session = self.connection.session() 
        count = session.query(func.count(User._id)).scalar()
        response = self.post('/register', dict(email='eve@eviler.com', username='Eva', password='eveisevil'))
        self.assertEqual(response[1], 200)
        newCount = session.query(func.count(User._id)).scalar()
        self.assertGreater(newCount, count)

    def test_register_user_with_missing_email(self):
        session = self.connection.session()
        count = session.query(func.count(User._id)).scalar()
        response = self.post('/register', dict(email='', username='Eva', password='eveisevil')) 
        self.assertEqual(response[1], 400)
        newCount = session.query(func.count(User._id)).scalar()
        self.assertEqual(newCount, count)
