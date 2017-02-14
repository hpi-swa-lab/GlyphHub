as yet unclassified
primitiveLayoutSetJustify
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout justify |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	justify := interpreterProxy booleanValueOf: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 100 ].
	
	self cCode: 'pango_layout_set_justify(layout, justify)'.
	
	^interpreterProxy pop: interpreterProxy methodArgumentCount