from frt_server.tests import TestMinimal
from frt_server.tables import Thread, ThreadSubscription, User
from time import sleep

class SubscriptionTestCase(TestMinimal):
    def setUp(self):
        super().setUp()

        self.login_as('eve@evil.com', 'eveisevil')
        self.session = self.connection.session
        self.user = self.session.query(User).get(self.user_id)
        self.thread = Thread(title="Test", closed=False)
        self.subscription = ThreadSubscription(user=self.user, thread=self.thread)
        self.auth_header = [('Authorization', self.cachedApiToken)]

        self.session.add(self.thread, self.subscription) 
        self.session.commit()


    def test_update_last_visited(self):
        oldTime = self.subscription.last_visited
        sleep(1)

        data, status = self.patch('/thread/' + str(self.thread._id) + '/visit', None, headers=self.auth_header) 
        self.assertEqual(status, 200)

        newTime = self.subscription.last_visited
        self.assertGreater(newTime, oldTime)

    def test_update_visit_missing_thread(self):
        data, status = self.patch('/thread/7/visit', None, headers=self.auth_header)
        self.assertEqual(status, 404)

    def test_update_visit_not_subscribed(self):
        self.session.delete(self.subscription)
        self.session.commit()
        data, status = self.patch('/thread/' + str(self.thread._id) + '/visit', None, headers=self.auth_header) 
        self.assertEqual(status, 404)
