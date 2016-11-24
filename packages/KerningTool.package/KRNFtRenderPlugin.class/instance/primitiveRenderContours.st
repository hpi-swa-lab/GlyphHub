as yet unclassified
primitiveRenderContours
	" outline, form, point "
	<export: true>
	<var: #pointsPtr type: 'long *'>
	<var: #contoursPtr type: 'short *'>
	<var: #tagsPtr type: 'char *'>
	<var: #firstPixel type: 'uint8_t *'>
	<var: #lastPixel type: 'uint8_t *'>
	| outlineOop contours numPoints points pointsPtr tags contoursPtr numContours tagsPtr bitmapOop firstPixel formOop lastPixel pitch pointOop x y |
	interpreterProxy methodArgumentCount = 3 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	" extract points, contours and tags arrays from outline class "
	outlineOop := interpreterProxy stackValue: 2.
	
	points := interpreterProxy fetchPointer: 1 ofObject: outlineOop.
	pointsPtr := interpreterProxy firstIndexableField: points.
	pointsPtr = 0 ifTrue: [ ^interpreterProxy primitiveFail ].
	numPoints := (interpreterProxy byteSizeOf: points) / 8.
	
	contours := interpreterProxy fetchPointer: 2 ofObject: outlineOop.
	contoursPtr := interpreterProxy firstIndexableField: contours.
	numContours := interpreterProxy fetchInteger: 4 ofObject: outlineOop.
	
	tags := interpreterProxy fetchPointer: 3 ofObject: outlineOop.
	tagsPtr := interpreterProxy firstIndexableField: tags.
	
	" get x and y coordinates from our point "
	pointOop := interpreterProxy stackValue: 0.
	x := interpreterProxy fetchInteger: 0 ofObject: pointOop.
	y := interpreterProxy fetchInteger: 1 ofObject: pointOop.
	
	" extract necessary values from our form/bitmap "
	formOop := interpreterProxy stackObjectValue: 1.
	bitmapOop := interpreterProxy fetchPointer: 0 ofObject: formOop.
	firstPixel := interpreterProxy firstIndexableField: bitmapOop.
	lastPixel := firstPixel + (interpreterProxy byteSizeOf: bitmapOop).
	pitch := (interpreterProxy fetchInteger: 1 ofObject: formOop) * 4.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].  
	
	self cCode: 'sqRenderContours(firstPixel, lastPixel, x, y, pitch, numContours, numPoints, pointsPtr, contoursPtr, tagsPtr)'.
	
	interpreterProxy
		pop: interpreterProxy methodArgumentCount + 1
		thenPush: (interpreterProxy integerObjectOf: 1)