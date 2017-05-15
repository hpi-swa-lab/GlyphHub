primitives
primitiveRegisterCustomFontDirectory
	<var: #strPtr type: 'char *'>
	<export: true>

	| strLen strPtr strValue |
	interpreterProxy methodArgumentCount = 1 ifFalse: [ ^interpreterProxy primitiveFail ].

	
	strValue := interpreterProxy stackValue: 0.
	(interpreterProxy isBytes: strValue) ifFalse: [ ^interpreterProxy primitiveFailFor: 105 ].
	strPtr := interpreterProxy firstIndexableField: strValue.
	strLen := interpreterProxy byteSizeOf: strValue.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 101 ].
	
	self cCode: 'sqRegisterCustomFontDirectory(strPtr, strLen)'.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].
	interpreterProxy pop: interpreterProxy methodArgumentCount