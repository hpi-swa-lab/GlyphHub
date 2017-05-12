initialize-release
loadSortedGlyphData

	^ self renderer loadDataForAllGlyphs
		then: [:renderer |
			self gridWidget glyphNames: (self sortedGlyphNamesFrom: renderer)]