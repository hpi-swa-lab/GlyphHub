loading
loadGlyph

	^ self enteredFromGlyph
		ifNotNil: [:theGlyph |
			(FRTGlyph load: theGlyph id populate: #( 'font' 'font.family') from: self backend)
				then: [:newGlyph | self enteredFromGlyph: newGlyph]]
		ifNil: [BTPromise unit: nil].