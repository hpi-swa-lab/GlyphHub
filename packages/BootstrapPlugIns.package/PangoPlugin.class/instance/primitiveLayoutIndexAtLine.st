primitives
primitiveLayoutIndexAtLine
	" layout, line, xOffset "
	<var: #layout type: 'PangoLayout *'>
	<export: true>

	| layout x index out trailing line |
	interpreterProxy methodArgumentCount = 3 ifFalse: [ ^interpreterProxy primitiveFail ].

	layout := self sqLayoutForHandle: (interpreterProxy stackIntegerValue: 2).
	
	line := interpreterProxy stackIntegerValue: 1.
	x := interpreterProxy stackIntegerValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].

	index := 0.
	trailing := 0.
	
	self cCode: 'PangoLayoutLine *l = pango_layout_get_line_readonly(layout, line);
	pango_layout_line_x_to_index(l, x * PANGO_SCALE, &index, &trailing)'.

	index := self byteOffsetToIndex: layout offset: index.
	
	out := interpreterProxy instantiateClass: (interpreterProxy classArray) indexableSize: 2.
	interpreterProxy storePointer: 0 ofObject: out withValue: (interpreterProxy integerObjectOf: index).
	interpreterProxy storePointer: 1 ofObject: out withValue: (interpreterProxy integerObjectOf: trailing).
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: interpreterProxy methodArgumentCount + 1 thenPush: out