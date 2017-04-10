font-upload
convertUnicodeToGlyphNames: aString of: aFontOrId

	| data id |
	data := {'unicode' -> aString} as: Dictionary.
	id := aFontOrId isBTModel ifTrue: [aFontOrId id] ifFalse: [aFontOrId].
	
	^ self
		request: 'font/', id, '/convert'
		method: 'POST'
		data: data