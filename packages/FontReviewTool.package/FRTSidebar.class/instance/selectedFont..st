accessing
selectedFont: aFont

	selectedFont := aFont.
	
	^ (FRTFont load: self selectedFont id populate: #('family' 'family.fonts') from: self topLevel backend)
		then: [:fontWithFamily | self selectedFamily: aFont family]