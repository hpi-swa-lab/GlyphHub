actions
importObject: aWidget

	| wrapper |
	wrapper := FRTTransformHandles new target: aWidget.

	drawingContainer add: wrapper.
	wrapper center: drawingContainer center