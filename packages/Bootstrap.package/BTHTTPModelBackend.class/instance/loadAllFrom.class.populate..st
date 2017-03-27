as yet unclassified
loadAllFrom: aString class: aClass populate: aCollection
	| response contentJson |
	
	response := WebClient new httpGet: (self class backendURL, aString).
	response isSuccess ifFalse: [^self error: 'The request did not succed!']. 
	contentJson := Json readFrom: (ReadStream on: (response content)).
	^BTModelList withAll: ((contentJson at: '_items') collect: [ :item | | instance |
		instance := aClass new.
		aClass instVarNames do: [:name |
			instance instVarNamed: name put: (item at: name asString)].
		instance])