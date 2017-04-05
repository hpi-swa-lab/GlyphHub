load-ufo
loadUfoDetails: aQueryDictionary font: aFont
	
	^ self
		request: 'font/', aFont id, '/ufo?', (WebUtils encodeUrlEncodedForm: {'query' -> aQueryDictionary asJsonString})
		method: 'GET'
		data: nil