accessing
font: aFont

	font := aFont.
	self topLevel updateBreadcrumbs.
	self renderer font: aFont.
	(self renderer loadDataForAllGlyphs)
		then: [:renderer |
			self gridWidget glyphNames: renderer loadedGlifs keys].
	
	self loadThreads.	
	
	fontNameLabel heading: aFont fontName.
	fontAuthorLabel text: 'by: ', aFont author username