mock-data
loadUfoDetails: aQueryDictionary font: aFont
	" return the necessary keys such that most consumers won't fail "

	| query requestedGlifs |
	query := aQueryDictionary as: Dictionary.
	requestedGlifs := query at: 'glifs' ifAbsent: [#()].
	
	^ BTPromise unit: (Dictionary newFrom: {
		'fontinfo' -> (Dictionary newFrom: {'ascender' -> 100. 'descender' -> 50. 'unitsPerEm' -> 1000}).
		'glifs' -> (self availableGlifs associationsSelect: [:association | requestedGlifs includesKey: association key]).
		'glyphs' -> ((self availableGlifs keys collect: [:name | name -> (name, '.glif')]) as: Dictionary)})