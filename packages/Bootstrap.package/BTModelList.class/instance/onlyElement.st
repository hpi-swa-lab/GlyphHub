testing
onlyElement

	^ self size == 1
		ifTrue: [self anyOne]
		ifFalse: [Error signal: 'Trying to get only element of BTModelList with more than one element.']