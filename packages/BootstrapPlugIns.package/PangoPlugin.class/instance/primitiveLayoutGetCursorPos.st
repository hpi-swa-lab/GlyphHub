primitives
primitiveLayoutGetCursorPos
	<var: #layout type: 'PangoLayout *'>
	<export: true>

	| layout index out |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].

	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	index := interpreterProxy stackIntegerValue: 0.
	
	self cCode: '
	PangoRectangle strongRect;
	PangoRectangle weakRect;
	const char *text = pango_layout_get_text(layout);
	int offset = g_utf8_offset_to_pointer (text, index) - text;
	pango_layout_get_cursor_pos(layout, offset, &strongRect, &weakRect)'.
	
	out := interpreterProxy instantiateClass: (interpreterProxy classArray) indexableSize: 4.
	interpreterProxy
		storePointer: 0
		ofObject: out
		withValue: (self
			createPointX: (self cCode: 'PANGO_PIXELS(strongRect.x)')
			y: (self cCode: 'PANGO_PIXELS(strongRect.y)')).
	interpreterProxy
		storePointer: 1
		ofObject: out
		withValue: (self
			createPointX: (self cCode: 'PANGO_PIXELS(strongRect.width)')
			y: (self cCode: 'PANGO_PIXELS(strongRect.height)')).
	interpreterProxy
		storePointer: 2
		ofObject: out
		withValue: (self
			createPointX: (self cCode: 'PANGO_PIXELS(weakRect.x)')
			y: (self cCode: 'PANGO_PIXELS(weakRect.y)')).
	interpreterProxy
		storePointer: 3
		ofObject: out
		withValue: (self
			createPointX: (self cCode: 'PANGO_PIXELS(weakRect.width)')
			y: (self cCode: 'PANGO_PIXELS(weakRect.height)')).
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: (interpreterProxy methodArgumentCount + 1) thenPush: out