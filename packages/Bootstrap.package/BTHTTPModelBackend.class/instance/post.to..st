as yet unclassified
post: aModel to: aTable
	| client |
	client := WebClient new server: self class backendURL.
	
	^ client httpPost: (self class backendURL, aTable) content: aModel dirtyFieldsAndValues asJsonString type: 'application/json'