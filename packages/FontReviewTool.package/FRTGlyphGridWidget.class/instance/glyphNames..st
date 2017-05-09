accessing
glyphNames: aCollection

	| requestDictionary |
	glyphNames := aCollection.
	requestDictionary := {
		'glyphName' -> glyphNames . 
		'fontId' -> self font id
		} as: Dictionary.
	(self topLevel backend loadWhere: requestDictionary into: FRTGlyph populate: #('threadGlyphAssociations'))
	"this promise only resolves with glyph models that already exist on the server. However, not every glyph has an entry on the server so we need to create our own models"
		then: [ :loadedGlyphModels | | allGlyphModels |
			allGlyphModels := self completeGlyphModelCollection: loadedGlyphModels.
			self createGlyphPreviewWidgetsFor: allGlyphModels]