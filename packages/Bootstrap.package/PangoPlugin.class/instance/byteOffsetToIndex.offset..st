as yet unclassified
byteOffsetToIndex: layout offset: offset
	<var: #layout type: 'PangoLayout *'>
	| index |
	index := 0.
	self cCode: 'const char *text = pango_layout_get_text(layout);
	index = g_utf8_pointer_to_offset(text, text + offset)'.
	^index