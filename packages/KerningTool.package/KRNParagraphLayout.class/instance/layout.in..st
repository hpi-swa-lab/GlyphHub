as yet unclassified
layout: aKRNGlyphContainer in: aRectangle
	| width |
	owner := aKRNGlyphContainer.
	previousGlyph := nil.
	
	aKRNGlyphContainer hasSubmorphs ifFalse: [ ^self ].
	
	font := aKRNGlyphContainer firstSubmorph font.
	x := aRectangle left.
	y := aRectangle top.
	yAdvance := font height * aKRNGlyphContainer firstSubmorph scale * self lineHeight.
	layoutCache := OrderedCollection new.
	rowOffsets := OrderedCollection new.
	
	aKRNGlyphContainer submorphs reverseDo: [ :glyph |
		glyph isGlyph
			ifFalse: [
				glyph layoutInBounds: (x @ y extent: 2 @ yAdvance).
				glyph isCR ifTrue: [ self nextLine: aRectangle ]]
			ifTrue: [
				width := glyph advanceScaled x.
				
				(self kerning and: [previousGlyph notNil]) ifTrue: [
					x := x + ((font findKerningBetween: previousGlyph and: glyph) * glyph scale) ].
				
				width + x > aRectangle right ifTrue: [ self nextLine: aRectangle ].
				
				layoutCache add: {glyph. x @ y}.
				x := x + width.
				previousGlyph := glyph ]].
	
	self nextLine: aRectangle