as yet unclassified
layout: aKRNGlyphContainer in: aRectangle
	| x y font glyphs yAdvance previousGlyph width |
	aKRNGlyphContainer owner detailViewBounds: aRectangle.

	x := aRectangle left.
	y := aRectangle top.
	previousGlyph := nil.
	
	owner := aKRNGlyphContainer.
	
	aKRNGlyphContainer hasSubmorphs ifFalse: [ ^self ].
	
	font := aKRNGlyphContainer firstSubmorph font.
	yAdvance := font height * aKRNGlyphContainer firstSubmorph scale * self lineHeight.
	glyphs := aKRNGlyphContainer submorphs reverse.
	
	glyphs do: [ :glyph |
		glyph isGlyph
			ifFalse: [
				glyph layoutInBounds: (x @ y extent: 2 @ yAdvance).
				glyph isCR ifTrue: [
					x := aRectangle left.
					y := y + yAdvance ]]
			ifTrue: [
				width := glyph advanceScaled x.
				
				(self kerning and: [previousGlyph notNil]) ifTrue: [
					x := x + ((font findKerningBetween: previousGlyph and: glyph) * glyph scale) ].
				
				width + x > aRectangle right ifTrue: [
					x := aRectangle left.
					y := y + yAdvance ].
				
				glyph layoutInBounds: (x @ y extent: glyph extent).
				x := x + width.
				previousGlyph := glyph ]]