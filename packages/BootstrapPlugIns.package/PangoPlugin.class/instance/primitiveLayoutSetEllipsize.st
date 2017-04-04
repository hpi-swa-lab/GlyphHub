primitives
primitiveLayoutSetEllipsize
	" layout, mode (0->NONE, 1->START, 2->MIDDLE, 3->END)"
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout mode |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	mode := interpreterProxy stackIntegerValue: 0.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 100 ].
	
	self cCode: 'pango_layout_set_ellipsize(layout, mode)'.
	
	^interpreterProxy pop: interpreterProxy methodArgumentCount