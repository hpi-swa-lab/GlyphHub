from frt_server.tables import *
import frt_server.config

from eve.utils import config

ID_FIELD = '_id'
config.ID_FIELD = ID_FIELD

DEBUG = True
REQUEST_DEBUG = True
RESPONSE_DEBUG = False
SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_RECORD_QUERIES = False
SQLALCHEMY_ECHO = False
SQLALCHEMY_DATABASE_URI = 'sqlite://' + frt_server.config.DATABASE_PATH
RESOURCE_METHODS = ['GET', 'POST']
ITEM_METHODS = ['GET', 'PUT', 'DELETE']
IF_MATCH = False
HATEOAS = False

DOMAIN = {
    'user': User._eve_schema['user'],
    'tag': Tag._eve_schema['tag'],
    'sample_text': SampleText._eve_schema['sample_text'],
    'family': Family._eve_schema['family'],
    'font': Font._eve_schema['font'],
    'glyph': Glyph._eve_schema['glyph'],
    'thread': Thread._eve_schema['thread'],
    'codepoint': Codepoint._eve_schema['codepoint'],
    'comment': Comment._eve_schema['comment'],
    'attachment': Attachment._eve_schema['attachment']
}
