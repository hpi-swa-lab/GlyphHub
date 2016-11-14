as yet unclassified
primitiveDetectGlyphs
	<export: true>
	<var: #fileNamePtr type: 'char *'>
	<var: #rects type: 'sqInt *'>
	| fileNameLen fileNamePtr fileNameValue rectsLen arrayOop rects ret |
	interpreterProxy methodArgumentCount = 1 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	rectsLen := 0.
	ret := 1.
	rects := nil.
	
	" fetch fontName argument pointer and length "
	fileNameValue := interpreterProxy stackValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	(interpreterProxy isBytes: fileNameValue) ifFalse: [ ^interpreterProxy primitiveFail ].
	fileNamePtr := interpreterProxy firstIndexableField: fileNameValue.
	fileNameLen := interpreterProxy byteSizeOf: fileNameValue.
	
	self cCode: 'ret = sqDetectGlyphs(fileNamePtr, fileNameLen, &rects, &rectsLen)'.
	ret = 0 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	arrayOop := interpreterProxy instantiateClass: interpreterProxy classArray indexableSize: rectsLen * 4.
	
	0 to: (rectsLen * 4) - 1 do: [ :i |
		interpreterProxy storePointer: i ofObject: arrayOop withValue: (interpreterProxy integerObjectOf: (self cCode: 'rects[i]')) ].
	
	self cCode: 'free(rects)'.
	
	interpreterProxy
		pop: interpreterProxy methodArgumentCount + 1
		thenPush: arrayOop