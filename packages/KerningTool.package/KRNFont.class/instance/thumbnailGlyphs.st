as yet unclassified
thumbnailGlyphs
	| unicodes |
	unicodes := self availableUnicodes ifEmpty: [ ^{} ].
	
	^{
		unicodes detect: [ :c | c = $A asUnicode ] ifNone: [ unicodes atRandom ].
		unicodes detect: [ :c | c = $a asUnicode ] ifNone: [ unicodes atRandom ]
	} collect: [ :char | Unicode charFromUnicode: char ]