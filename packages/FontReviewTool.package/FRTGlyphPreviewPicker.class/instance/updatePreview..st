as yet unclassified
updatePreview: aString

	| list |
	list := OrderedCollection new.
	glyph1 text ifNotEmpty: [list add: glyph1 text].
	glyph2 text ifNotEmpty: [list add: glyph2 text].
	preview glyphNames: list