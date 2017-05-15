mock-data
loadUfoDetails: aQueryDictionary font: aFont
	" return the necessary keys such that most consumers won't fail "

	| query defaultGlifs |
	query := aQueryDictionary as: Dictionary.
	defaultGlifs := #('A' 'a' 'space').

	^ BTPromise unit: (Dictionary newFrom: {
		'fontinfo' -> (Dictionary newFrom: {'ascender' -> 100. 'descender' -> 50. 'unitsPerEm' -> 1000}).
		'glifs' -> ((((query at: 'glifs' ifAbsent: []) ifNil: [defaultGlifs]) collect: [:glyphName | glyphName -> (self mockGlif: glyphName)]) as: Dictionary).
		'glyphs' -> ((defaultGlifs collect: [:name | name -> (name, '.glif')]) as: Dictionary)})