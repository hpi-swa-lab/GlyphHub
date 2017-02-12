as yet unclassified
attachTo: aClickable
	" makes the given clickable toggle this dialog "
	aClickable do: [ :clickable :event |
		self owner
			ifNil: [ self openFor: clickable event: event ]
			ifNotNil: [ self delete ]]