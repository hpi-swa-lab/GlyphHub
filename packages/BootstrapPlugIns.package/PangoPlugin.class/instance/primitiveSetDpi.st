primitives
primitiveSetDpi
	<export: true>
	| dpi |
	interpreterProxy methodArgumentCount = 1 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	dpi := interpreterProxy stackIntegerValue: 0.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	
	self sqSetDpi: dpi.
	
	interpreterProxy pop: interpreterProxy methodArgumentCount