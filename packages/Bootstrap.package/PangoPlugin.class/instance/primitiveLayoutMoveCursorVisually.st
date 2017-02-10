as yet unclassified
primitiveLayoutMoveCursorVisually
	" primLayout: layout moveCursor: strong index: index trailing: trailing direction: direction "
	<var: #layout type: 'PangoLayout *'>
	<export: true>

	| layout direction index strong trailing newIndex newTrailing out |
	interpreterProxy methodArgumentCount = 5 ifFalse: [ ^interpreterProxy primitiveFail ].

	layout := self cCoerce: (interpreterProxy stackIntegerValue: 4) to: 'PangoLayout*'.
	strong := interpreterProxy booleanValueOf: (interpreterProxy stackValue: 3).
	index := interpreterProxy stackIntegerValue: 2.
	trailing := interpreterProxy stackIntegerValue: 1.
	direction := interpreterProxy stackIntegerValue: 0.
	newIndex := 0.
	newTrailing := 0.
	
	self cCode: '
	const char *text = pango_layout_get_text(layout);
	int offset = g_utf8_offset_to_pointer (text, index) - text;
	
	pango_layout_move_cursor_visually(layout, strong, offset, trailing, direction, &newIndex, &newTrailing);
	
	newIndex = g_utf8_pointer_to_offset(text, text + newIndex)'.

	out := interpreterProxy instantiateClass: (interpreterProxy classArray) indexableSize: 2.
	interpreterProxy storePointer: 0 ofObject: out withValue: (interpreterProxy integerObjectOf: newIndex).
	interpreterProxy storePointer: 1 ofObject: out withValue: (interpreterProxy integerObjectOf: newTrailing).
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: (interpreterProxy methodArgumentCount + 1) thenPush: out