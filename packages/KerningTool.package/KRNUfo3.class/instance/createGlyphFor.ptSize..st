as yet unclassified
createGlyphFor: aCharacter ptSize: aNumber
	aCharacter = Character cr
		ifTrue: [ ^KRNControlCharacter new font: self; ptSize: aNumber; yourself ]
		ifFalse: [ ^self createGlyphForUnicode: aCharacter asUnicode ptSize: aNumber ]