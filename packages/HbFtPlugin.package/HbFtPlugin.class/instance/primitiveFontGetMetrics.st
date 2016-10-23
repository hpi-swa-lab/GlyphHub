as yet unclassified
primitiveFontGetMetrics
	<var: #srcPtr type: 'char *'>
	<export: true>
	| value srcLen srcPtr ascender descender structOop dpi ptSize height maxAdvance |
	interpreterProxy methodArgumentCount = 3 ifFalse: [
		^interpreterProxy primitiveFail ].
	
	ascender := 0.
	descender := 0.
	height := 0.
	maxAdvance := 0.

	dpi := interpreterProxy stackIntegerValue: 0.
	ptSize := interpreterProxy stackIntegerValue: 1.
	value := interpreterProxy stackValue: 2.
	(interpreterProxy isBytes: value) ifFalse: [ ^interpreterProxy primitiveFail ].
	srcPtr := interpreterProxy firstIndexableField: value.
	srcLen := interpreterProxy byteSizeOf: value.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].

	self cCode: 'sqGetFontMetrics(srcPtr, srcLen, ptSize, dpi, &ascender, &descender, &height, &maxAdvance);'.
	
	interpreterProxy failed ifTrue: [ ^nil ].
	structOop := interpreterProxy instantiateClass: interpreterProxy classArray indexableSize: 4.
	interpreterProxy storePointer: 0 ofObject: structOop withValue: (interpreterProxy integerObjectOf: ascender).
	interpreterProxy storePointer: 1 ofObject: structOop withValue: (interpreterProxy integerObjectOf: descender).
	interpreterProxy storePointer: 2 ofObject: structOop withValue: (interpreterProxy integerObjectOf: height).
	interpreterProxy storePointer: 3 ofObject: structOop withValue: (interpreterProxy integerObjectOf: maxAdvance).
	
	interpreterProxy
		pop: interpreterProxy methodArgumentCount + 1
		thenPush: structOop