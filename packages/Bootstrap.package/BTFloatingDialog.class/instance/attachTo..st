as yet unclassified
attachTo: aClickable
	" makes the given clickable toggle this dialog "
	aClickable when: #clicked evaluate: [ :event |
		self owner
			ifNil: [ self openFor: aClickable event: event ]
			ifNotNil: [ self delete ]]