as yet unclassified
primitiveFontMeasureWidth
	<var: #srcPtr type: 'char *'>
	<var: #strPtr type: 'char *'>
	<export: true>
	| value srcLen srcPtr dpi ptSize strLen strPtr string result |
	interpreterProxy methodArgumentCount = 4 ifFalse: [
		^interpreterProxy primitiveFail ].
	
	dpi := interpreterProxy stackIntegerValue: 0.
	ptSize := interpreterProxy stackIntegerValue: 1.
	value := interpreterProxy stackValue: 2.
	string := interpreterProxy stackValue: 3.
	
	(interpreterProxy isBytes: value) ifFalse: [ ^interpreterProxy primitiveFail ].
	(interpreterProxy isBytes: string) ifFalse: [ ^interpreterProxy primitiveFail ].
	
	srcPtr := interpreterProxy firstIndexableField: value.
	srcLen := interpreterProxy byteSizeOf: value.
	strPtr := interpreterProxy firstIndexableField: string.
	strLen := interpreterProxy byteSizeOf: string.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].

	result := self cCode: 'sqFontMeasureWidth(srcPtr, srcLen, ptSize, dpi, strPtr, strLen);'.
	
	interpreterProxy failed ifTrue: [ ^0 ].
	
	interpreterProxy
		pop: interpreterProxy methodArgumentCount + 1
		thenPush: (interpreterProxy integerObjectOf: result)