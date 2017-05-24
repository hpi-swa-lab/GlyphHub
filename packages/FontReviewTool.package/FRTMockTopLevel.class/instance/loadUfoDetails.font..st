mock-data
loadUfoDetails: aQueryDictionary font: aFont
	" return the necessary keys such that most consumers won't fail "

	| query requestedGlifs |
	query := aQueryDictionary as: Dictionary.
	requestedGlifs := query at: 'glifs' ifAbsent: [#()].
	requestedGlifs := requestedGlifs isDictionary ifTrue: [requestedGlifs keys] ifFalse: [requestedGlifs].
	
	^ BTPromise unit: (Dictionary newFrom: {
		'fontinfo' -> (Dictionary newFrom: {'ascender' -> 100. 'descender' -> -30. 'unitsPerEm' -> 1000}).
		'glifs' -> (requestedGlifs ifNil: [self availableGlifs] ifNotNil: [self availableGlifs associationsSelect: [:association | requestedGlifs includes: association key]]).
		'glyphs' -> ((self availableGlifs keys collect: [:name | name -> (name, '.glif')]) as: Dictionary)})