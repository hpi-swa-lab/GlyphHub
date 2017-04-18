import os

from werkzeug.datastructures import FileStorage

from frt_server.tables import *
import frt_server.config

user1 = User(username='Eva', password='eveisevil')
family1 = Family(family_name='Riblon Sans')

glyph1 = Glyph(glyph_name='A', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1)
glyph2 = Glyph(glyph_name='a', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1)
glyph3 = Glyph(glyph_name='s', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1)
thread1 = Thread(title='I don\'t like this word')

thread1.thread_glyph_associations.append(ThreadGlyphAssociation(glyph=glyph1))
thread1.thread_glyph_associations.append(ThreadGlyphAssociation(glyph=glyph2))
thread1.thread_glyph_associations.append(ThreadGlyphAssociation(glyph=glyph3))

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
    SampleText(title='Evil Wizards', text='Mad wizards brew evil jack with horses', author_id=2),
    SampleText(title='Long Sample Text', text='Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', author_id=1)
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

