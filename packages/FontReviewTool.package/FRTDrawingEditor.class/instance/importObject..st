actions
importObject: aWidget

	| wrapper |
	wrapper := FRTTransformHandles new target: aWidget.
	
	drawingContainer add: wrapper.
	
	self ensureContentsFit.
	
	wrapper center: drawingContainer center