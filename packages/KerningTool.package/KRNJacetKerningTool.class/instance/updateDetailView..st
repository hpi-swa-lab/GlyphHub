change reporting
updateDetailView: aString

	self detailView removeAllMorphs.
	aString do: [ :char |
		self detailView addMorph: ((self font createGlyphFor: char ptSize: self detailPtSize)
			color: Color black;
			yourself) ]