import os

BASE = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', 'frt_server')

# empty database path means in-memory
DATABASE_PATH = '//tmp/frt_server.db'

UPLOAD_FOLDER = os.path.join(BASE, 'uploads')
ATTACHMENT_UPLOAD_FOLDER = os.path.join(UPLOAD_FOLDER, 'attachment')
FONT_UPLOAD_FOLDER = os.path.join(UPLOAD_FOLDER, 'font')
FAMILY_UPLOAD_FOLDER = os.path.join(UPLOAD_FOLDER, 'family')
SECRET_KEY = 'this-is-my-super-secret-key'
DEBUG = False
REQUEST_DEBUG = True
RESPONSE_DEBUG = True
