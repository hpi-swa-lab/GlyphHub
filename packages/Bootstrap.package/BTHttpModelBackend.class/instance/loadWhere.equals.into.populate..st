operations
loadWhere: aSelector equals: aValue into: aClass populate: aCollection
	
	| whereEqualsDict table |
	self flag: #TODO "Refactor this to actually handle collections of selectors and values into a dict".
	table := self class camelCaseToUnderscore: aClass modelName.  
	
	aSelector == #id ifTrue: [
		^ (self request: table, '/', aValue, '?', (self populateString: aCollection) method: 'GET' data: nil)
			then: [:item | BTModelList with: (self jsonToModel: item modelClass: aClass)]].
	
	whereEqualsDict := OrderedDictionary new
		at: aSelector put: aValue;
		yourself.
	
	^ self loadWhere: whereEqualsDict into: aClass populate: aCollection