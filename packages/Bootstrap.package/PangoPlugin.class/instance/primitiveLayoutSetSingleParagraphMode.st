as yet unclassified
primitiveLayoutSetSingleParagraphMode
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout single |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	single := interpreterProxy booleanValueOf: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 100 ].
	
	self cCode: 'pango_layout_set_justify(layout, single)'.
	
	^interpreterProxy pop: interpreterProxy methodArgumentCount