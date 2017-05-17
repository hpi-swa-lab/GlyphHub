font-upload
downloadFontOtf: aFontOrId

	| id |
	id := aFontOrId isBTModel ifTrue: [aFontOrId id] ifFalse: [aFontOrId].
	^ self
		downloadFontOtf: id
		into: BTPangoTextLayout fontCacheDirectory
		named: id asString