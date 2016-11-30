as yet unclassified
contents: aString
	text := aString.
	
	self removeAllMorphs.
	
	self font ifNotNil: [
		self contents do: [ :char |
			self addMorph: ((self font createGlyphFor: char ptSize: self ptSize)
				color: Color black;
				yourself) ]]