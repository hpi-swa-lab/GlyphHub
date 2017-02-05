as yet unclassified
primitiveLayoutHeightForWidth
	" set the given width on the layout and return the height needed. only return dimensions if width is below 0 "
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout width height ptOop |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	width := interpreterProxy stackIntegerValue: 0.
	height := 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 100 ].
	
	self cCode: 'pango_layout_set_width(layout, width == -1 ? -1 : width * PANGO_SCALE)'.
	self cCode: 'pango_layout_get_pixel_size(layout, &width, &height)'.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 101 ].
	
	" create a point "
	ptOop := self createPointX: width y: height.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].
	^interpreterProxy pop: interpreterProxy methodArgumentCount + 1 thenPush: ptOop