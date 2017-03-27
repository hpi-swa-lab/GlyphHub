from tables import *

fira = Font(name='Fira Sans Regular', family_id=1, author_id=1)
fira.tags.append(Tag(text='#pretty', type='opinion'))
fira.tags.append(Tag(text='Latin', type='language'))

thread1 = Thread(title='I don\'t like this word')
thread1.glyphs.append(Glyph(name='A', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1))
thread1.glyphs.append(Glyph(name='a', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1))
thread1.glyphs.append(Glyph(name='s', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1))

entities = [
    User(name='Eva', password='eveisevil'),
    User(name='Tom', password='safepwissafe'),
    Family(name='Fira'),
    fira,
    thread1,
    Codepoint(value=0x0041, size=12.5, features='liga', thread_id=1, font_id=1),
    Codepoint(value=0x0061, size=12.5, features='liga', thread_id=1, font_id=1),
    Codepoint(value=0x0073, size=12.5, features='liga', thread_id=1, font_id=1),
    Comment(text='why would anyone comment on aas', author_id=2, thread_id=1),
    Comment(text='because.', author_id=1, thread_id=1),
    SampleText(title='Evil Wizards', text='Mad wizards brew evil jack with horses', author_id=2)
]

