as yet unclassified
save: aModel to: aTable
	self flag: #todo. " when saving a new record we get an id back that we need to assign "
	^aModel id == 0
		ifTrue: [	self post: aModel to: aTable]
		ifFalse: [self put: aModel to: aTable]