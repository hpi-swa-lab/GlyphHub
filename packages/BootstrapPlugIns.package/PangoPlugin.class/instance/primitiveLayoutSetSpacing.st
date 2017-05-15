primitives
primitiveLayoutSetSpacing
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout spacing |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self sqLayoutForHandle: (interpreterProxy stackIntegerValue: 1).
	spacing := interpreterProxy stackIntegerValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 100 ].
	
	self cCode: 'pango_layout_set_spacing(layout, spacing * PANGO_SCALE)'.
	
	^interpreterProxy pop: interpreterProxy methodArgumentCount