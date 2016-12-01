as yet unclassified
addSpace
	" find the minimum width of the font's glyph and create a space form for it "
	self addGlyph: (Form extent: (glyphs values collect: [ :form | form first width ]) min @ 1 depth: 32) for: Character space asUnicode