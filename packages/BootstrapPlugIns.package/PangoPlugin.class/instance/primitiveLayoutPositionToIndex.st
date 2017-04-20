primitives
primitiveLayoutPositionToIndex
	<var: #layout type: 'PangoLayout *'>
	<var: #x type: 'float'>
	<var: #y type: 'float'>
	<export: true>

	| layout pointOop x y index out success trailing |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].

	layout := self sqLayoutForHandle: (interpreterProxy stackIntegerValue: 1).
	
	pointOop := interpreterProxy stackValue: 0.
	x := self extractPoint: pointOop index: 0.
	y := self extractPoint: pointOop index: 1.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].
	
	success := false.
	index := 0.
	trailing := 0.
	
	self cCode: '
	int ix = (int) x * PANGO_SCALE;
	int iy = (int) y * PANGO_SCALE;
	success = pango_layout_xy_to_index(layout, ix, iy, &index, &trailing)'.

	index := self byteOffsetToIndex: layout offset: index.
	
	out := interpreterProxy instantiateClass: (interpreterProxy classArray) indexableSize: 3.
	interpreterProxy storePointer: 0 ofObject: out withValue: (interpreterProxy integerObjectOf: success).
	interpreterProxy storePointer: 1 ofObject: out withValue: (interpreterProxy integerObjectOf: index).
	interpreterProxy storePointer: 2 ofObject: out withValue: (interpreterProxy integerObjectOf: trailing).
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: interpreterProxy methodArgumentCount + 1 thenPush: out