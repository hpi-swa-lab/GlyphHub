accessing
glyphNames: aCollection

	glyphNames := aCollection.
	(self topLevel backend
		loadWhere: {#glyphName -> glyphNames. #font -> self font}
		into: FRTGlyph
		populate: #('threadGlyphAssociations'))
	"this promise only resolves with glyph models that already exist on the server. However, not every glyph has an entry on the server so we need to create our own models"
		then: [ :loadedGlyphModels | | allGlyphModels |
			allGlyphModels := self completeGlyphModelCollection: loadedGlyphModels.
			self createGlyphPreviewWidgetsFor: allGlyphModels]