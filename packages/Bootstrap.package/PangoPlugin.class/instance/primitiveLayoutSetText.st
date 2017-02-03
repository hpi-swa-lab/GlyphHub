as yet unclassified
primitiveLayoutSetText
	" set the given width on the layout and return the height needed "
	<var: #layout type: 'PangoLayout *'>
	<var: #strPtr type: 'char *'>
	<export: true>

	| layout strLen strPtr strValue |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].

	layout := self cCoerce: (interpreterProxy stackIntegerValue: 1) to: 'PangoLayout*'.
	
	strValue := interpreterProxy stackValue: 0.
	(interpreterProxy isBytes: strValue) ifFalse: [ ^interpreterProxy primitiveFailFor: 105 ].
	strPtr := interpreterProxy firstIndexableField: strValue.
	strLen := interpreterProxy byteSizeOf: strValue.
	
	self cCode: 'pango_layout_set_text(layout, strPtr, strLen)'.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: interpreterProxy methodArgumentCount