examples
exampleAllGlyphs

	| backend |
	backend := FRTHttpBackend new.
	(((backend login: 'Eva' password: 'eveisevil')
		then: [:x | FRTFont load: 1 from: backend])
		then: [:font |
			FRTGlyphRenderer new 
				font: font;
				loadDataForAllGlyphs])
		then: [:renderer | | container |
			container := BTWidget new layoutPolicy: (FRTFixedGridLayout cellSize: 64).  
			renderer loadedGlifs keysAndValuesDo: [:glyphName :glif | | glyph label |
				glyph := (FRTGlyphWidget newWithRenderer: renderer) pointSize: 32; glyphNames: {glyphName}.
				label := BTLabel small: glyphName.
				container add: ((BTWidget new withLayout; vertical: true)
					add: glyph;
					add: label)].
			
			BTTopLevel new
				add: container;
				openInWorld]