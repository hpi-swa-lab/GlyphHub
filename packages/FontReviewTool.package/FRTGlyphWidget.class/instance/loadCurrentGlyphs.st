accessing
loadCurrentGlyphs

	currentLoadingOperation := ((renderer loadDataFor: self glyphNames)
		then: [
			self
				changed;
				resizeToPreferred;
				fullBounds;
				yourself])
		catch: [self]