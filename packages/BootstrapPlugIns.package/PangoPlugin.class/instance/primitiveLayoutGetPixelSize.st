primitives
primitiveLayoutGetPixelSize
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout width height ptOop |
	interpreterProxy methodArgumentCount = 1 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self sqLayoutForHandle: (interpreterProxy stackIntegerValue: 0).
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 103 ].
	width := -1.
	height := -1.
	
	self cCode: 'pango_layout_get_pixel_size(layout, &width, &height)'.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 101 ].
	
	" create a point "
	ptOop := self createPointX: width y: height.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].
	^interpreterProxy pop: interpreterProxy methodArgumentCount + 1 thenPush: ptOop