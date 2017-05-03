as yet unclassified
simpleFontinfo

	^ Dictionary new
		at: 'unitsPerEm' put: self unitsPerEm;
		at: 'ascender' put: self ascender;
		at: 'descender' put: self descender;
		yourself