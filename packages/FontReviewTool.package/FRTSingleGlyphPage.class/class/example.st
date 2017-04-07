as yet unclassified
example

	| application page |
	page := FRTSingleGlyphPage new.
	application := FRTApplication firstPage: page.
	(((application login: 'Eva' password: 'eveisevil')
		then: [(FRTGlyph load: 1 from: application backend)])
		then: [:glyph | page glyph: glyph])
		then: [application openInWorld]	