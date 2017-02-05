as yet unclassified
primitiveLayoutSetHeight
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout height |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	height := interpreterProxy stackIntegerValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 100 ].
	
	self cCode: 'pango_layout_set_height(layout, height == -1 ? -1 : height * PANGO_SCALE)'.
	
	^interpreterProxy pop: interpreterProxy methodArgumentCount