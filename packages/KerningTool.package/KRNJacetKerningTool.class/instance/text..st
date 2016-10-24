as yet unclassified
text: aString
	text := aString.
	
	targetView removeAllMorphs.
	text do: [ :char |
		targetView addMorph: ((self font createGlyphFor: char ptSize: self targetPtSize)
			color: Color black;
			yourself) ].
	
	targetView addMorphBack: cursor