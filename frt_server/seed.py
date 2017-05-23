import os

from werkzeug.datastructures import FileStorage

from frt_server.tables import *
import frt_server.config

user1 = User(username='Eva', password='eveisevil', email='eve@evil.com', biography='Eva has been designing fonts for a long time. Ever since she joined the HPI art club and later became its boss, she pushed for having more font design workshops and generally speaking sort of occasionally succeeded in doing so.')
family1 = Family(family_name='Riblon Sans', preview_glyphs='', author=user1, about='Riblon Sans is the perfect balance between lightweight strokes and clear readability. Due to its refreshingly unconventional style it is a perfect fit for any place where you may need a clever and beautiful typeface.')

glyph1 = Glyph(glyph_name='A', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1)
glyph2 = Glyph(glyph_name='a', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1)
glyph3 = Glyph(glyph_name='s', version_hash='9c7075ca420f30aedb27c48102466313fa4d12c8', font_id=1)
thread1 = Thread(title='I don\'t like this word', closed=False)

thread1.thread_glyph_associations.append(ThreadGlyphAssociation(glyph=glyph1))
thread1.thread_glyph_associations.append(ThreadGlyphAssociation(glyph=glyph2))
thread1.thread_glyph_associations.append(ThreadGlyphAssociation(glyph=glyph3))

entities = [
    user1,
    family1,
    User(username='Tom', password='safepwissafe', email='tom@penguin.com'),
    thread1,
    Codepoint(unicode_value=0x0041, point_size=12.5, features='liga', thread_id=1, font_id=1, index=0),
    Codepoint(unicode_value=0x0061, point_size=12.5, features='liga', thread_id=1, font_id=1, index=1),
    Codepoint(unicode_value=0x0073, point_size=12.5, features='liga', thread_id=1, font_id=1, index=2),
    Comment(text='why would anyone comment on aas', author_id=2, thread_id=1),
    Comment(text='because.', author_id=1, thread_id=1),
    SampleText(title='Evil Wizards', text='[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"Mad wizards brew evil jack with horses"}]', author_id=2),
    SampleText(title='Long Sample Text', text='[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\"de Finibus Bonorum et Malorum\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\"Lorem ipsum dolor sit amet..\\", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\"de Finibus Bonorum et Malorum\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."}]', author_id=1),
    SampleText(title='Arabic Text', text='[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"شدّت وعُرفت فصل"}]', author_id=2),
    SampleText(title='Chinese Text', text='[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"側経意責家方家閉討店暖育田庁載社転線宇"}]', author_id=2),
    SampleText(title='Armeninian Text', text='[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"լոռեմ իպսում դոլոռ սիթ "}]', author_id=2),
    SampleText(title='Russian Text', text='[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"Лорем ипсум долор сит амет, пер"}]', author_id=2),
    SampleText(title='Greek Text', text='[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"Λορεμ ιπσθμ δολορ σιτ "}]', author_id=2),
    SampleText(title='Korean Text', text='[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"국민경제의 발전을 위한 중요정책의 수립에"}]', author_id=2),
    SampleText(title='Japanese Text', text='[{"alignment":"left","font":null,"openTypeFeatures":null,"pointSize":16,"text":"恵ツ医威技析水リぞこじ環康ラモ"}]', author_id=2)
]
   
def post_create(entities):
    """should call this right after creating all `entities` and then save all returned values"""
    user1 = entities[0]
    family1 = entities[1]

    family1.process_filename('testFiles/RiblonSans/RiblonSans.glyphs', user1, 'First Version')

    font1 = family1.fonts[0]
    font1.tags.append(Tag(text='#pretty', type='opinion'))
    font1.tags.append(Tag(text='Latin', type='language'))

    return [font1]
