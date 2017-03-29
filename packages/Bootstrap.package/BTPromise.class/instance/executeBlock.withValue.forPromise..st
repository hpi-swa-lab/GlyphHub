private
executeBlock: aBlock withValue: anObject forPromise: aPromise
	| returnValue |
	[ returnValue := aBlock value: anObject ] on: Error do: [ :newError | ^aPromise rejectWith: newError ].
	returnValue ifNil: [ ^self ].
	
	returnValue == aPromise ifTrue: [ ^self error: 'Promise cannot chain to itself' ].
	
	(returnValue isPromise)
		ifTrue: [
			returnValue
				whenResolved: [ :value | aPromise resolveWith: value ];
				whenRejected: [ :error | aPromise rejectWith: error ]]
		ifFalse: [ aPromise resolveWith: returnValue ]