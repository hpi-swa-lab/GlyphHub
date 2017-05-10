mock-data
loadUfoDetails: aQueryDictionary font: aFont
	" return the necessary keys such that most consumers won't fail "

	^ self resolveWith: (Dictionary newFrom: {
		'fontinfo' -> (Dictionary newFrom: {'ascender' -> 100. 'descender' -> 50. 'unitsPerEm' -> 1000}).
		'glifs' -> (((aQueryDictionary at: 'glifs') collect: [:glyphName | glyphName -> (self mockGlif: glyphName)]) as: Dictionary)})