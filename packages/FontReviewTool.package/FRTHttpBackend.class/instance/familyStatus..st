font-upload
familyStatus: aFamilyOrId

	| id |
	id := aFamilyOrId isBTModel ifTrue: [aFamilyOrId id] ifFalse: [aFamilyOrId].
	
	^ self request: '/family/', id, '/status' method: 'GET' data: nil