as yet unclassified
layout: aKRNGlyphContainer in: aRectangle
	| x y font glyphs yAdvance |
	x := aRectangle left.
	y := aRectangle top.
	
	aKRNGlyphContainer hasSubmorphs ifFalse: [ ^self ].
	
	font := aKRNGlyphContainer firstSubmorph font.
	yAdvance := font height * aKRNGlyphContainer firstSubmorph scale * self lineHeight.
	glyphs := aKRNGlyphContainer submorphs reverse.
	
	glyphs doWithIndex: [ :glyph :index | | width |
		glyph isCursor
			ifTrue: [ glyph layoutInBounds: (x @ y extent: 2 @ yAdvance) ]
			ifFalse: [
				width := glyph advanceScaled x.
				
				index > 1 ifTrue: [
					width := width + ((font findKerningBetween: (glyphs at: index - 1) and: glyph) * glyph scale) ].
				
				width + x > aRectangle right ifTrue: [
					x := aRectangle left.
					y := y + yAdvance ].
				glyph layoutInBounds: (x @ y extent: glyph extent).
				x := x + width ]]