from tables import User
from eve.utils import config

ID_FIELD = '_id'
config.ID_FIELD = ID_FIELD

DEBUG = True
SQLALCHEMY_RECORD_QUERIES = DEBUG
SQLALCHEMY_ECHO = DEBUG
SQLALCHEMY_DATABASE_URI = 'sqlite://'
RESOURCE_METHODS = ['GET', 'POST', 'DELETE']
ITEM_METHODS = ['GET', 'PUT', 'DELETE']
IF_MATCH = False
HATEOAS = False

DOMAIN = {
    'user': User._eve_schema['user']
}
