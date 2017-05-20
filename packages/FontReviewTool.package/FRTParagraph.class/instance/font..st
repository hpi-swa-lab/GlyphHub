accessing
font: aFontOrAFontName

	aFontOrAFontName isBTModel
		ifTrue: [
			self fontNameForPango: aFontOrAFontName fontNameForPango.
			self fontId: aFontOrAFontName id]
		ifFalse: [self fontNameForPango: aFontOrAFontName]".
	
	fontNameForPango ifNotNil: [super font: fontNameForPango]"