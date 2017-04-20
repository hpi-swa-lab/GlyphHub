primitives
primitiveLayoutLineNumberOfIndex
	" layout, index "
	<var: #layout type: 'PangoLayout *'>
	<export: true>

	| layout x index out line |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].

	layout := self sqLayoutForHandle: (interpreterProxy stackIntegerValue: 1).
	
	index := interpreterProxy stackIntegerValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].
	
	line := 0.
	x := 0.
	index := self indexToByteOffset: layout index: index.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 122 ].
	
	self cCode: 'pango_layout_index_to_line_x(layout, index, 0, &line, &x)'.
	
	out := interpreterProxy instantiateClass: (interpreterProxy classArray) indexableSize: 2.
	interpreterProxy storePointer: 0 ofObject: out withValue: (interpreterProxy integerObjectOf: line).
	interpreterProxy storePointer: 1 ofObject: out withValue: (interpreterProxy integerObjectOf: (self cCode: 'PANGO_PIXELS(x)')).
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: interpreterProxy methodArgumentCount + 1 thenPush: out