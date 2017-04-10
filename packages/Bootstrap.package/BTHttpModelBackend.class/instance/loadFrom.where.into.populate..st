private
loadFrom: aTableNameString where: aSelectorValueDictionary into: aClass populate: aCollection
	
	| final |
	final := Dictionary new.
	aSelectorValueDictionary keysAndValuesDo: [ :key :value |
		final
			at: (self class camelCaseToUnderscore: key)
			put: (value isBTModel ifTrue: [value id] ifFalse: [value])].
	
	^ (self
		request: aTableNameString, '?where=', final asJsonString, '&', (self populateString: aCollection)
		method: 'GET'
		data: nil)
		then: [:list | (list at: '_items') collect: [:item | self jsonToModel: item modelClass: aClass]]