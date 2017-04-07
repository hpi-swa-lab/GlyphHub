load-ufo
loadUfoDetails: aQueryDictionary font: aFontOrId
	
	| id |
	id := aFontOrId isBTModel ifTrue:[aFontOrId id] ifFalse: [aFontOrId].
	^ self
		request: 'font/', id, '/ufo?', (WebUtils encodeUrlEncodedForm: {'query' -> (aQueryDictionary as: Dictionary) asJsonString})
		method: 'GET'
		data: nil