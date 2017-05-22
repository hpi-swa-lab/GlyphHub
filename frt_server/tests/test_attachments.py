from frt_server.tests import TestMinimal
from frt_server.tables import AttachmentType

class AttachmentsTestCase(TestMinimal):
    def helper_upload_picture(self):
        attachment, status = self.upload_file('/attachment/upload', 'file', 'assets/cat.jpg')
        self.assertEqual(status, 200)

        return attachment, status

    def test_upload_attachment(self):
        self.login_as('eve@evil.com', 'eveisevil')
        attachment, _ = self.helper_upload_picture()
        self.assertEqual(attachment['type'], AttachmentType.picture)
        self.assertEqual(attachment['data1'], 'cat.jpg')
        self.assertEqual(attachment['owner_id'], self.user_id)

    def test_fetch_unassigned_attachments(self):
        self.login_as('eve@evil.com', 'eveisevil')
        url = '/attachment?where={{"comment_id":null,"owner_id":{}}}'.format(self.user_id)

        attachments, status = self.get(url)
        self.assertEqual(status, 200)
        self.assertEqual(len(attachments['_items']), 0)

        self.helper_upload_picture()

        attachments, status = self.get(url)
        self.assertEqual(status, 200)
        self.assertEqual(len(attachments['_items']), 1)

    def test_unauthorized(self):
        _, status = self.upload_file('/attachment/upload', 'file', 'assets/cat.jpg')
        self.assertEqual(status, 401)

