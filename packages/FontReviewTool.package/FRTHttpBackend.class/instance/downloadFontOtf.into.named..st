font-upload
downloadFontOtf: aFontOrId into: aDirectory named: aString

	| id filename |
	id := aFontOrId isBTModel ifTrue: [aFontOrId id] ifFalse: [aFontOrId].
	
	self flag: #todo. " make sure names are unique across versions "
	filename := aString, '.otf'.
	aDirectory assureExistence.
	
	^ (aDirectory fileExists: filename)
		ifTrue: [BTPromise unit: filename]
		ifFalse: [
			(self request: '/font/', id, '/otf' method: 'GET' data: '' contentType: 'text/plain')
				then: [:response |
					aDirectory forceNewFileNamed: filename do: [:stream | stream binary; nextPutAll: response content].
					BTPangoTextLayout refreshFontCache.
					filename]]