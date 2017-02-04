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
	((interpreterProxy isBytes: strValue) or: [interpreterProxy isWords: strValue])
		ifFalse: [ ^interpreterProxy primitiveFailFor: 105 ].
	strPtr := interpreterProxy firstIndexableField: strValue.
	strLen := interpreterProxy byteSizeOf: strValue.
	
	self cCode: '
	PangoAttrList *attr_list;
	char *text;

	if (pango_parse_markup(strPtr,
                    strLen,
                    0,
                    &attr_list,
                    &text,
                    NULL,
                    NULL)) {
		pango_layout_set_attributes(layout, attr_list);
		pango_layout_set_text(layout, text, -1);

		g_free(text);
		pango_attr_list_unref(attr_list);
	} else {
		pango_layout_set_text(layout, strPtr, strLen);
	}'.
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: interpreterProxy methodArgumentCount