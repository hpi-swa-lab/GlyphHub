as yet unclassified
checked: aBoolean
	checked := aBoolean.
	
	self icon: (checked ifTrue: [ #check ] ifFalse: [ #none ])