examples
example

	| backend |
	backend := FRTHttpBackend new.
	((((backend login: 'Eva' password: 'eveisevil')
		then: [:x | FRTFont load: 1 from: backend])
		then: [:font | FRTGlyphRenderer new font: font; loadDataFor: {'A'. 'a'. 's'}])
		then: [:renderer |
			(renderer formForGlyphs: {'A'. 'a'. 's'} size: 30) asMorph openInHand])
		whenRejected: #signal