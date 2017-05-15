primitives
primitiveLayoutSetFont
	" set the given width on the layout and return the height needed "
	<var: #layout type: 'PangoLayout *'>
	<var: #strPtr type: 'char *'>
	<export: true>

	| layout strLen strPtr strValue |
	interpreterProxy methodArgumentCount = 2 ifFalse: [ ^interpreterProxy primitiveFail ].

	layout := self sqLayoutForHandle: (interpreterProxy stackIntegerValue: 1).
	
	strValue := interpreterProxy stackValue: 0.
	(interpreterProxy isBytes: strValue) ifFalse: [ ^interpreterProxy primitiveFailFor: 105 ].
	strPtr := interpreterProxy firstIndexableField: strValue.
	strLen := interpreterProxy byteSizeOf: strValue.
	
	self cCode: '
	strPtr = g_strndup(strPtr, strLen);
	PangoFontDescription *desc = pango_font_description_from_string(strPtr);
	pango_layout_set_font_description(layout, desc);
	pango_font_description_free(desc);
	g_free(strPtr)'.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: interpreterProxy methodArgumentCount