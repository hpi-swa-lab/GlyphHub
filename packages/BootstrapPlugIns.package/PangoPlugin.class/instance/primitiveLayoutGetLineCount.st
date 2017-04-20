primitives
primitiveLayoutGetLineCount
	<var: #layout type: 'PangoLayout *'>
	<export: true>
	
	| layout lines |
	interpreterProxy methodArgumentCount = 1 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self sqLayoutForHandle: (interpreterProxy stackIntegerValue: 0).
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 103 ].
	
	lines := self cCode: 'pango_layout_get_line_count(layout)'.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 101 ].
	
	^interpreterProxy
		pop: interpreterProxy methodArgumentCount + 1
		thenPush: (interpreterProxy integerObjectOf: lines)