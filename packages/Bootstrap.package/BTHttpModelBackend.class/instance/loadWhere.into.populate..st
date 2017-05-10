operations
loadWhere: anAssociationList into: aClass populate: aCollection
	
	| final associations |
	associations := aClass associations.
	final := anAssociationList collect: [:association |
		((self class camelCaseToUnderscore: association key), ((associations includes: association key) ifTrue: ['_id'] ifFalse: [''])) ->
		(association value isBTModel ifTrue: [association value id] ifFalse: [association value])].
	
	^ (self
		request: (self class camelCaseToUnderscore: aClass modelName), '?where=', (final as: Dictionary) asJsonString, '&', (self populateString: aCollection)
		method: 'GET'
		data: nil)
		then: [:list | (list at: '_items') collect: [:item | self jsonToModel: item modelClass: aClass]]