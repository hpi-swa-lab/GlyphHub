actions
importForm: aForm

	| wrapper |
	wrapper := FRTTransformHandles new target: aForm asMorph.
	
	drawingContainer add: aForm asMorph.
	
	self ensureContentsFit.
	
	wrapper center: drawingContainer center