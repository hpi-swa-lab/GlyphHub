font-upload
convertUnicodeToGlyphNames: aString features: aFeatureString of: aFontOrId

	| data id |
	data := {'unicode' -> aString. 'features' -> aFeatureString} as: Dictionary.
	id := aFontOrId isBTModel ifTrue: [aFontOrId id] ifFalse: [aFontOrId].
	
	^ self
		request: 'font/', id, '/convert'
		method: 'POST'
		data: data