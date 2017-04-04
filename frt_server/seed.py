import os

from werkzeug.datastructures import FileStorage

from frt_server.tables import *
import frt_server.config

user1 = User(username='Eva', password='eveisevil')
family1 = Family(family_name='Fira')

thread1 = Thread(title='I don\'t like this word')
thread1.glyphs.append(Glyph(glyph_name='A', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1))
thread1.glyphs.append(Glyph(glyph_name='a', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1))
thread1.glyphs.append(Glyph(glyph_name='s', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1))

entities = [
    user1,
    family1,
    User(username='Tom', password='safepwissafe'),
    thread1,
    Codepoint(unicode_value=0x0041, point_size=12.5, features='liga', thread_id=1, font_id=1, index=0),
    Codepoint(unicode_value=0x0061, point_size=12.5, features='liga', thread_id=1, font_id=1, index=1),
    Codepoint(unicode_value=0x0073, point_size=12.5, features='liga', thread_id=1, font_id=1, index=2),
    Comment(text='why would anyone comment on aas', author_id=2, thread_id=1),
    Comment(text='because.', author_id=1, thread_id=1),
    SampleText(title='Evil Wizards', text='Mad wizards brew evil jack with horses', author_id=2)
]

def post_create(entities):
    """should call this right after creating all `entities` and then save all returned values"""
    user1 = entities[0]
    family1 = entities[1]

    with open(os.path.join(frt_server.config.BASE, '../testFiles/RiblonSans/RiblonSans.glyphs'), 'rb') as glyphs:
        family1.process_file(FileStorage(glyphs, 'RiblonSans.glyphs'), user1)

    font1 = family1.fonts[0]
    font1.tags.append(Tag(text='#pretty', type='opinion'))
    font1.tags.append(Tag(text='Latin', type='language'))

    return [font1]

