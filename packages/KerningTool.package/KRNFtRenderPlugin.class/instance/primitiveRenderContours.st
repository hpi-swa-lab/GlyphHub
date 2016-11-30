as yet unclassified
primitiveRenderContours
	" outline, form, point, red, green, blue, alpha "
	<export: true>
	<var: #pointsPtr type: 'long *'>
	<var: #contoursPtr type: 'short *'>
	<var: #tagsPtr type: 'char *'>
	<var: #firstPixel type: 'uint8_t *'>
	<var: #lastPixel type: 'uint8_t *'>
	<var: #red type: 'float'>
	<var: #green type: 'float'>
	<var: #blue type: 'float'>
	<var: #alpha type: 'float'>
	| outlineOop contours numPoints points pointsPtr tags contoursPtr numContours tagsPtr bitmapOop firstPixel formOop lastPixel pitch pointOop x y ret alpha blue green red |
	ret := 0.
	
	interpreterProxy methodArgumentCount = 7 ifFalse: [ ^interpreterProxy primitiveFailFor: PrimErrBadNumArgs ].
	
	" extract points, contours and tags arrays from outline class "
	outlineOop := interpreterProxy stackValue: 6.
	
	points := interpreterProxy fetchPointer: 1 ofObject: outlineOop.
	pointsPtr := interpreterProxy firstIndexableField: points.
	pointsPtr = 0 ifTrue: [ ^interpreterProxy primitiveFailFor: PrimErrInappropriate ].
	numPoints := (interpreterProxy byteSizeOf: points) / 8.
	
	contours := interpreterProxy fetchPointer: 2 ofObject: outlineOop.
	contoursPtr := interpreterProxy firstIndexableField: contours.
	numContours := interpreterProxy fetchInteger: 4 ofObject: outlineOop.
	
	tags := interpreterProxy fetchPointer: 3 ofObject: outlineOop.
	tagsPtr := interpreterProxy firstIndexableField: tags.
	
	" get x and y coordinates from our point "
	pointOop := interpreterProxy stackValue: 4.
	x := interpreterProxy fetchInteger: 0 ofObject: pointOop.
	y := interpreterProxy fetchInteger: 1 ofObject: pointOop.
	
	" extract necessary values from our form/bitmap "
	formOop := interpreterProxy stackObjectValue: 5.
	bitmapOop := interpreterProxy fetchPointer: 0 ofObject: formOop.
	firstPixel := interpreterProxy firstIndexableField: bitmapOop.
	lastPixel := firstPixel + (interpreterProxy byteSizeOf: bitmapOop).
	pitch := (interpreterProxy fetchInteger: 1 ofObject: formOop) * 4.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: PrimErrUnsupported ].
	
	" get color "
	red := interpreterProxy stackFloatValue: 3.
	green := interpreterProxy stackFloatValue: 2.
	blue := interpreterProxy stackFloatValue: 1.
	alpha := interpreterProxy stackFloatValue: 0.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: PrimErrBadArgument ].
	
	self cCode: 'ret = sqRenderContours(firstPixel, lastPixel, x, y, pitch, numContours, numPoints, pointsPtr, contoursPtr, tagsPtr, red, green, blue, alpha)'.
	
	ret = 0 ifFalse: [ ^interpreterProxy primitiveFailFor: -1 ].  
	
	interpreterProxy
		pop: interpreterProxy methodArgumentCount + 1
		thenPush: (interpreterProxy integerObjectOf: 1)