as yet unclassified
primitiveLayoutSetWidth
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout width |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	width := interpreterProxy stackIntegerValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 100 ].
	
	self cCode: 'pango_layout_set_width(layout, width < 0 ? width : width * PANGO_SCALE)'.
	
	^interpreterProxy pop: interpreterProxy methodArgumentCount