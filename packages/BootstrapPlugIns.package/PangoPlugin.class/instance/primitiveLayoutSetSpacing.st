primitives
primitiveLayoutSetSpacing
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout spacing |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	spacing := interpreterProxy stackIntegerValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 100 ].
	
	self cCode: 'pango_layout_set_ellipsize(layout, spacing * PANGO_SCALE)'.
	
	^interpreterProxy pop: interpreterProxy methodArgumentCount