import os

from werkzeug.datastructures import FileStorage

from frt_server.tables import *
import frt_server.config

impallariUser = User(username='Impallari', password='dragfontshere')

entities [
    impallariUser,
    SampleText(title='Latin 1 Text', text='', author_id=1),
]

def impallari_post_create(entities):
    """should call this right after creating all `entities` and then save all returned values"""
    impallariUser = users[0]
    for text in entities[1:]:
        text.user = impallariUser
