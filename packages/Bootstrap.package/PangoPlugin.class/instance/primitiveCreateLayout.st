primitives
primitiveCreateLayout
	<var: #layout type: 'PangoLayout *'>
	<export: true>

	| layout |
	interpreterProxy methodArgumentCount = 0 ifFalse: [ ^interpreterProxy primitiveFailFor: 111 ].

	layout := self sqCreateLayout.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 110 ].
	
	interpreterProxy
		pop: (interpreterProxy methodArgumentCount + 1)
		thenPush: (interpreterProxy integerObjectOf: (self cCoerce: layout to: 'sqInt'))