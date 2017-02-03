as yet unclassified
primitiveLayoutHeightForWidth
	" set the given width on the layout and return the height needed "
	<var: #layout type: 'PangoLayout *'>
	<export: true>

	| layout width height |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].

	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	width := interpreterProxy stackIntegerValue: 0.
	height := 0.
	
	self cCode: 'pango_layout_set_width(layout, width * PANGO_SCALE)'.
	self cCode: 'pango_layout_get_pixel_size(layout, &width, &height)'.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy
		pop: (interpreterProxy methodArgumentCount + 1)
		thenPush: (interpreterProxy integerObjectOf: height)