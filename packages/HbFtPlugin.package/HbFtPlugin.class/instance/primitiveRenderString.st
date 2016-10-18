as yet unclassified
primitiveRenderString
	<var: #srcPtr type: 'char *'>
	<export: true>
	| value result srcLen srcPtr |
	interpreterProxy methodArgumentCount = 1 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	value := interpreterProxy stackValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	(interpreterProxy isBytes: value) ifFalse: [ ^interpreterProxy primitiveFail ].
	srcPtr := interpreterProxy firstIndexableField: value.
	srcLen := interpreterProxy byteSizeOf: value.
	
	result := self sqRenderString: srcPtr Len: srcLen.
	
	interpreterProxy failed ifTrue: [ ^nil ].
	
	interpreterProxy
		pop: interpreterProxy methodArgumentCount + 1
		thenPush: (interpreterProxy integerObjectOf: result)