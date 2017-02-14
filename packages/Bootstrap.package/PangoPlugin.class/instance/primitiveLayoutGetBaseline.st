as yet unclassified
primitiveLayoutGetBaseline
	<var: #layout type: 'PangoLayout *'>
	<var: #baseline type: 'float'>
	<export: true>
	
	| layout baseline |
	interpreterProxy methodArgumentCount = 1 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self cCoerce: (interpreterProxy stackIntegerValue: 0) to: 'PangoLayout*'.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 103 ].
	
	baseline := self cCode: 'PANGO_PIXELS((float) pango_layout_get_baseline(layout))'.
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 101 ].
	
	^interpreterProxy
		pop: interpreterProxy methodArgumentCount + 1
		thenPush: (interpreterProxy floatObjectOf: baseline)