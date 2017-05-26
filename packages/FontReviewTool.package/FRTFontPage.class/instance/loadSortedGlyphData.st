initialize-release
loadSortedGlyphData
	
	^ self renderer loadDataForAllGlyphs
		then: [self gridWidget glyphNames: (self sortedGlyphNamesFrom: self renderer)]