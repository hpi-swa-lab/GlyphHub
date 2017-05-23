font-upload
convertUnicodeToGlyphNames: aString features: aCollection of: aFontOrId

	| data id |
	data := {'unicode' -> aString. 'features' -> aCollection} as: Dictionary.
	id := aFontOrId isBTModel ifTrue: [aFontOrId id] ifFalse: [aFontOrId].
	
	^ self
		request: 'font/', id, '/convert'
		method: 'POST'
		data: data