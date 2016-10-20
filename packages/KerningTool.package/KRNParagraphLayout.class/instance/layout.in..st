as yet unclassified
layout: aKRNGlyphContainer in: aRectangle
	| x y font glyphs |
	x := aRectangle left.
	y := aRectangle top.
	
	aKRNGlyphContainer hasSubmorphs ifFalse: [ ^self ].
	
	font := aKRNGlyphContainer firstSubmorph font.
	glyphs := aKRNGlyphContainer submorphs reverse.
	
	glyphs doWithIndex: [ :glyph :index | | width |
		width := glyph advanceScaled x.
		
		index > 1 ifTrue: [
			width := width + ((font findKerningBetween: (glyphs at: index - 1) and: glyph) * glyph scale) ].
		
		width + x > aRectangle right ifTrue: [
			x := aRectangle left.
			y := y + (glyph font height * glyph scale * self lineHeight) ].
		glyph layoutInBounds: (x @ y extent: glyph extent).
		x := x + width ]