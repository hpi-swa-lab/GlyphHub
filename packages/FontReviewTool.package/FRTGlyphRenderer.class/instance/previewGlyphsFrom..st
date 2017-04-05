accessing
previewGlyphsFrom: aGlyphDictionary
	
	self flag: #todo. " lots of room for sophistication here. could maintain a list of good letters per script etc "
	
	aGlyphDictionary ifEmpty: [^{}].
	aGlyphDictionary size = 1 ifTrue: [^{aGlyphDictionary keys first}].
	aGlyphDictionary size = 2 ifTrue: [^ aGlyphDictionary keys].
	
	^ {(aGlyphDictionary includesKey: 'A') ifTrue: ['A'] ifFalse: [aGlyphDictionary keys atRandom].
	    (aGlyphDictionary includesKey: 'a') ifTrue: ['a'] ifFalse: [aGlyphDictionary keys atRandom]}