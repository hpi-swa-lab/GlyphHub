operations
loadFrom: aTableNameString where: aSelector equals: aValue into: aClass populate: aCollection
	| whereEqualsDict table |
	self flag: #TODO "Refactor this to actually handle collections of selectors and values into a dict".
	table := self camelCaseToUnderscore: aTableNameString.  
	
	aSelector == #id ifTrue: [
		^(self request: table, '/', aValue method: 'GET' data: nil)
			then: [ :item | BTModelList with: (self jsonToModel: item modelClass: aClass) ]].
	
	whereEqualsDict := OrderedDictionary new
		at: aSelector put: aValue;
		yourself.
	
	^self loadFrom: table where: whereEqualsDict into: aClass populate: aCollection