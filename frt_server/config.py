import os

testing = os.getenv('FRT_TESTING', '0') == '1'

BASE = os.path.dirname(os.path.realpath(__file__))

UPLOAD_FOLDER = os.path.join(BASE, 'test_uploads' if testing else 'uploads')
FONT_UPLOAD_FOLDER = os.path.join(UPLOAD_FOLDER, 'font')
FAMILY_UPLOAD_FOLDER = os.path.join(UPLOAD_FOLDER, 'family')

