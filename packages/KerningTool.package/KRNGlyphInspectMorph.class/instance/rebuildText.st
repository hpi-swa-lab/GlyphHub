initialize-release
rebuildText
	self removeAllMorphs.
	
	self font ifNotNil: [
		self text do: [ :char |
			self addMorph: ((self font createGlyphFor: char ptSize: self ptSize)
				color: Color black;
				yourself) ]]