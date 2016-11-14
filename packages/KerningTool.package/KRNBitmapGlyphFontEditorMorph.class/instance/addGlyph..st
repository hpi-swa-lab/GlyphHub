as yet unclassified
addGlyph: aForm
	| character |
	character := UIManager default request: 'Enter corresponding charater'.
	
	font addGlyph: aForm for: character first asUnicode.
	inspectView text: inspectView text, character