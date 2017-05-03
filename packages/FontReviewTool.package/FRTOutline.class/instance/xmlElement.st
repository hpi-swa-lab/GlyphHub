as yet unclassified
xmlElement

	| glyph oldIndex outline |
	glyph := self glif firstTagNamed: #glyph.
	outline := glyph firstTagNamed: #outline.
	oldIndex := glyph elementsAndContents indexOf: outline.
	glyph removeElement: outline.
	glyph elementsAndContents add: self outlineXmlElement beforeIndex: oldIndex.

	^ self glif