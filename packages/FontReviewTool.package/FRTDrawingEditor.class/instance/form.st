accessing
form

	self flag: #todo. "restore active state after picture is taken"
	drawingContainer submorphsDo: [:widget |
		widget isTransformHandles ifTrue: [widget active: false]].
	
	^ drawingContainer imageForm