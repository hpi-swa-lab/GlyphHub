primitives
primitiveLayoutGetLogicalAttributes
	" set the given width on the layout and return the height needed "
	<var: #layout type: 'PangoLayout *'>
	<var: #attrs type: 'const PangoLogAttr *'>
	<var: #bitfield type: 'unsigned int'>
	<export: true>

	| layout out nAttrs attrs bitfield |
	interpreterProxy methodArgumentCount = 1 ifFalse: [ ^interpreterProxy primitiveFail ].
	
	layout := self sqLayoutForHandle: (interpreterProxy stackIntegerValue: 0).
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFailFor: 102 ].
	
	nAttrs := 0.
	attrs := self cCode: 'pango_layout_get_log_attrs_readonly(layout, &nAttrs);'.
	
	out := interpreterProxy instantiateClass: (interpreterProxy classArray) indexableSize: nAttrs.
	
	0 to: (nAttrs - 1) do: [ :i |
		bitfield := 0.
		self cCode: '
		bitfield |= (!!attrs[i].is_line_break) << 0;
		bitfield |= (!!attrs[i].is_mandatory_break) << 1;
		bitfield |= (!!attrs[i].is_char_break) << 2;
		bitfield |= (!!attrs[i].is_white) << 3;
		bitfield |= (!!attrs[i].is_cursor_position) << 4;
		bitfield |= (!!attrs[i].is_word_start) << 5;
		bitfield |= (!!attrs[i].is_word_end) << 6;
		bitfield |= (!!attrs[i].is_sentence_boundary) << 7;
		bitfield |= (!!attrs[i].is_sentence_start) << 8;
		bitfield |= (!!attrs[i].is_sentence_end) << 9;
		bitfield |= (!!attrs[i].backspace_deletes_character) << 10;
		bitfield |= (!!attrs[i].is_expandable_space) << 11;
		bitfield |= (!!attrs[i].is_word_boundary) << 12'.
		
		interpreterProxy
			storePointer: i
			ofObject: out
			withValue: (interpreterProxy positive32BitIntegerFor: bitfield) ].
	
	interpreterProxy failed ifTrue: [ ^interpreterProxy primitiveFail ].
	interpreterProxy pop: interpreterProxy methodArgumentCount + 1 thenPush: out