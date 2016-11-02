as yet unclassified
layout: aKRNGlyphContainer in: aRectangle
	| x y font yAdvance previousGlyph width props |
	aKRNGlyphContainer owner detailViewBounds: aRectangle.
	owner := aKRNGlyphContainer.
	previousGlyph := nil.
	
	aKRNGlyphContainer hasSubmorphs ifFalse: [ ^self ].
	
	props := self fontLayoutPropertiesOf: aKRNGlyphContainer in: aRectangle.
	x := props first.
	y := props second.
	font := props third.
	yAdvance := props fourth.
	
	aKRNGlyphContainer submorphs reverseDo: [ :glyph |
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