font-upload
downloadFontOTF: aFontOrId

	| id filename directory |
	id := aFontOrId isBTModel ifTrue: [aFontOrId id] ifFalse: [aFontOrId].
	
	self flag: #todo. " make sure names are unique across versions "
	filename := id asString, '.otf'.
	directory := BTPangoTextLayout fontCacheDirectory.
	directory assureExistence.
	
	^ (directory fileExists: filename)
		ifTrue: [BTPromise unit: filename]
		ifFalse: [
			(self request: '/font/', id, '/otf' method: 'GET' data: '' contentType: 'text/plain')
				then: [:response |
					directory forceNewFileNamed: filename do: [:stream | stream binary; nextPutAll: response content].
					BTPangoTextLayout refreshFontCache.
					filename]]