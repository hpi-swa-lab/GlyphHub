mock-data
loadUfoDetails: aQueryDictionary font: aFont
	" return the necessary keys such that most consumers won't fail "

	| query |
	query := aQueryDictionary as: Dictionary.

	^ BTPromise unit: (Dictionary newFrom: {
		'fontinfo' -> (Dictionary newFrom: {'ascender' -> 100. 'descender' -> 50. 'unitsPerEm' -> 1000}).
		'glifs' -> self availableGlifs.
		'glyphs' -> ((self availableGlifs keys collect: [:name | name -> (name, '.glif')]) as: Dictionary)})