load-ufo
loadUfoDetails: aQueryDictionary font: aFontOrId versionHash: aVersionHashString
	
	| id |
	id := aFontOrId isBTModel ifTrue: [aFontOrId id] ifFalse: [aFontOrId].
	^ self
		request: 'font/', id, '/ufo?', (WebUtils encodeUrlEncodedForm: {'query' -> (aQueryDictionary as: Dictionary) asJsonString. 'version' -> aVersionHashString})
		method: 'GET'
		data: nil