from tables import *

fira = Font(fontName='Fira Sans Regular', family_id=1, author_id=1)
fira.tags.append(Tag(text='#pretty', type='opinion'))
fira.tags.append(Tag(text='Latin', type='language'))

thread1 = Thread(title='I don\'t like this word')
thread1.glyphs.append(Glyph(glyphName='A', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1))
thread1.glyphs.append(Glyph(glyphName='a', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1))
thread1.glyphs.append(Glyph(glyphName='s', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1))

entities = [
    User(userName='Eva', password='eveisevil'),
    User(userName='Tom', password='safepwissafe'),
    Family(familyName='Fira'),
    fira,
    thread1,
    Codepoint(unicodeValue=0x0041, pointSize=12.5, features='liga', thread_id=1, font_id=1),
    Codepoint(unicodeValue=0x0061, pointSize=12.5, features='liga', thread_id=1, font_id=1),
    Codepoint(unicodeValue=0x0073, pointSize=12.5, features='liga', thread_id=1, font_id=1),
    Comment(text='why would anyone comment on aas', author_id=2, thread_id=1),
    Comment(text='because.', author_id=1, thread_id=1),
    SampleText(title='Evil Wizards', text='Mad wizards brew evil jack with horses', author_id=2)
]

