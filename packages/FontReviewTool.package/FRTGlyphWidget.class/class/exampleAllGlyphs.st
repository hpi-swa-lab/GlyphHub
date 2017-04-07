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
			container := BTWidget new
				layoutPolicy: (FRTFixedGridLayout cellSize: 64);
				spacing: BTWidget spacing / 2.
			
			renderer loadedGlifs keysAndValuesDo: [:glyphName :glif | | glyph label |
				glyph := (FRTGlyphWidget newWithRenderer: renderer)
					pointSize: 36;
					glyphNames: {glyphName};
					centered: true.
				
				label := BTLabel small: glyphName.
				container add: ((BTCard new withLayout; vertical: true)
					add: glyph;
					add: label)].
			
			BTTopLevel new
				add: container;
				openInWorld]