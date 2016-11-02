as yet unclassified
fontLayoutPropertiesOf: aKRNGlyphContainer in: aRectangle
	| font x y yAdvance scale |
	x := aRectangle left.
	y := aRectangle top.
	
	aKRNGlyphContainer hasSubmorphs ifFalse: [ ^{x. y. nil. 0} ].
	
	font := aKRNGlyphContainer firstSubmorph font.
	yAdvance := font height * aKRNGlyphContainer firstSubmorph scale * self lineHeight.
	scale := aKRNGlyphContainer firstSubmorph scale.
	
	^{x. y. font. yAdvance. scale}