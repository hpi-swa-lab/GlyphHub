as yet unclassified
indexToByteOffset: layout index: index
	<var: #layout type: 'PangoLayout *'>
	| offset |
	offset := 0.
	self cCode: 'const char *text = pango_layout_get_text(layout);
	offset = g_utf8_offset_to_pointer(text, index) - text'.
	^offset