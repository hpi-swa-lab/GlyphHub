as yet unclassified
primitiveLayoutHeightForWidth
	" set the given width on the layout and return the height needed "
	<var: #layout type: 'PangoLayout *'>
	<export: true>

	| layout width height ptOop xOop yOop |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].

	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	width := interpreterProxy stackIntegerValue: 0.
	height := 0.
	
	self cCode: 'pango_layout_set_width(layout, width * PANGO_SCALE)'.
	self cCode: 'pango_layout_get_pixel_size(layout, &width, &height)'.
	
	" create a point "
	ptOop := interpreterProxy instantiateClass: interpreterProxy classPoint indexableSize: 0.
	interpreterProxy pushRemappableOop: ptOop.
	xOop := interpreterProxy positive32BitIntegerFor: width.
	interpreterProxy pushRemappableOop: xOop.
	yOop := interpreterProxy positive32BitIntegerFor: height.
	xOop := interpreterProxy popRemappableOop.
	ptOop := interpreterProxy popRemappableOop.
	interpreterProxy storePointer: 0 ofObject: ptOop withValue: xOop.
	interpreterProxy storePointer: 1 ofObject: ptOop withValue: yOop.
	^interpreterProxy pop: interpreterProxy methodArgumentCount + 1 thenPush: ptOop