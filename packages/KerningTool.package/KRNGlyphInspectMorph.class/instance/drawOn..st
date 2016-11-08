initialize-release
drawOn: aCanvas
	| props font scale yAdvance down from kernMove firstLetter secondLetter kernDistance origin |
	super drawOn: aCanvas.
	
	self submorphs size < 2 ifTrue: [ ^self ].
	
	props := self layoutPolicy fontLayoutPropertiesOf: self in: self layoutBounds.
	origin := props first.
	font := props second.
	yAdvance := props third.
	scale := props fourth.
	
	" morphs are in reverse order "
	firstLetter := self submorphs second.
	secondLetter := self submorphs first.
	
	down := 0 @ (font ascender * scale) asInteger.
	
	" baseline "
	aCanvas line: origin + down to: self bounds topRight + down width: 1 color: Color gray.
	
	" account for centered layout "
	origin := origin + (self layoutPolicy rowOffsets first @ 0).
	
	" kerning helpers "
	from := origin + (firstLetter advanceScaled x @ 0).
	kernDistance := font findKerningBetween: firstLetter and: secondLetter.
	kernMove := (kernDistance * scale) @ 0.
	
	aCanvas
		line: from
		to: from + (0 @ self bounds height)
		width: 1
		color: Color red
		dashLength: self kerningLineStripeLength
		secondColor: Color transparent
		secondDashLength: self kerningLineStripeLength
		startingOffset: 0;
		
		line: from + kernMove
		to: from + (0 @ self bounds height) + kernMove
		width: 1
		color: Color transparent
		dashLength: self kerningLineStripeLength
		secondColor: Color green
		secondDashLength: self kerningLineStripeLength
		startingOffset: 0;
		
		drawString: kernDistance asString at: from + kernMove + down + 6 asPoint