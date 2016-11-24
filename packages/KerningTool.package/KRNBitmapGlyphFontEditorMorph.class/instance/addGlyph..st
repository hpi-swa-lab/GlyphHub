as yet unclassified
addGlyph: aForm
	| characters |
	characters := UIManager default request: 'Enter corresponding charater(s)'.
	
	characters do: [ :character | font addGlyph: aForm for: character asUnicode ].
	inspectView text: inspectView text, characters