operations
loadFrom: aTableNameString where: aSelector equals: aValue into: aClass populate: aCollection
	| whereEqualsDict |
	self flag: #TODO "Refactor this to actually handle collections of selectors and values into a dict".
	
	aSelector == #id ifTrue: [
		^(self request: aTableNameString, '/', aValue method: 'GET' data: nil)
			then: [ :item | BTModelList with: (self jsonToModel: item modelClass: aClass) ]].
	
	whereEqualsDict := OrderedDictionary new
		at: aSelector put: aValue;
		yourself.
	
	^self loadFrom: aTableNameString where: whereEqualsDict into: aClass populate: aCollection