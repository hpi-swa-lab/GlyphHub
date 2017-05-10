testing
testSetFontPreview

	| alert dialog |
	alert := (self expect: page) to haveA: BTAlert labelled: 'You haven''t selected preview glyphs for this font yet.'.
	self click: (alert findWidgetOfKind: BTButton).
	
	dialog := self findDialog: FRTGlyphPreviewPicker labelled: 'Select Preview Glyphs'.
	dialog formInputs first text: 'A'.
	dialog formInputs second text: 'a'.
	(self expect: dialog setPreviewGlyphs) to resolve.
	
	self assert: dialog font backend == self topLevel.
	self assert: dialog font family backend == self topLevel.
	(self expect: (FRTFamily load: family id populate: #() from: self topLevel) value previewGlyphs) to equal: 'A,a'.
	
	self openPage: page with: family defaultFont.
	(self expect: page) to not haveA: BTAlert labelled: 'You haven''t selected preview glyphs for this font yet.'