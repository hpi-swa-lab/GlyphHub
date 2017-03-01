as yet unclassified
hoverAttachTo: aClickable
	" makes the given clickable toggle this dialog whenever the mouse enters and leaves it "
	aClickable hoveredDo: [ :hovered :clickable :event |
		self owner
			ifNil: [ self openFor: clickable event: nil ]
			ifNotNil: [ self delete ]]