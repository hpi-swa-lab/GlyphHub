initialize-release
enteringWith: aGlyph

	^ (self loadGlyph: aGlyph)
		then: [:newGlyph |
			self
				propagateGlyph: newGlyph;
				loadThreadsFor: newGlyph]