accessing
loadCurrentGlyphs

	((renderer loadDataFor: self glyphNames)
		then: [self changed; layoutChanged])
		whenRejected: #signal