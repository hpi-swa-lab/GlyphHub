font-upload
downloadFontOtf: aFontOrId

	| id |
	id := aFontOrId isBTModel ifTrue: [aFontOrId id] ifFalse: [aFontOrId].
	^ self
		downloadFontOtf: aFontOrId
		into: BTPangoTextLayout fontCacheDirectory
		named: id asString