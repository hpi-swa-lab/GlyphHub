accessing
loadCurrentGlyphs

	currentLoadingOperation := ((renderer loadDataFor: self glyphNames)
		then: [
			self
				changed;
				extent: (self preferredSizeForWidth: 9e8) minSize;
				fullBounds;
				yourself])
		catch: [self]