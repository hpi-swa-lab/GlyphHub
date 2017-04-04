primitives
primitiveRegisterCustomFont
	" needs to be called before sqPangoInit() "
	<var: #strPtr type: 'char *'>
	<export: true>
	
	| strLen strPtr strValue |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].

	strValue := interpreterProxy stackValue: 0.
	((interpreterProxy isBytes: strValue) or: [interpreterProxy isWords: strValue])
		ifFalse: [ ^interpreterProxy primitiveFailFor: 105 ].
	strPtr := interpreterProxy firstIndexableField: strValue.
	strLen := interpreterProxy byteSizeOf: strValue.
	
	self sqRegisterCustomFont: strPtr Len: strLen.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: interpreterProxy methodArgumentCount