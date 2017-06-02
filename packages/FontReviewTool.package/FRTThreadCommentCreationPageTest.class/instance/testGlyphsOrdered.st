testing
testGlyphsOrdered

	| glyphWidget |
	self setupForThreadWithMultipleGlyphs.
	
	glyphWidget := page findWidgetOfKind: FRTGlyphWidget.
	(self expect: glyphWidget glyphNames) to containExactly: #('A' 'a' 's').
	
	self enterPageWithMultipleGlyphs.
	glyphWidget := page findWidgetOfKind: FRTGlyphWidget.
	(self expect: glyphWidget glyphNames) to containExactly: #('A' 'a' 's').
	
	self enterPageWithMultipleGlyphs.
	glyphWidget := page findWidgetOfKind: FRTGlyphWidget.
	(self expect: glyphWidget glyphNames) to containExactly: #('A' 'a' 's').
	
	self enterPageWithMultipleGlyphs.
	glyphWidget := page findWidgetOfKind: FRTGlyphWidget.
	(self expect: glyphWidget glyphNames) to containExactly: #('A' 'a' 's')