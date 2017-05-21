as yet unclassified
loadQueryFor: aGlyphNameCollection

	| query |
	aGlyphNameCollection do: [:glyphName | glifs at: glyphName put: BTPromise new].
	
	query := Dictionary new.
	fontinfo ifNil: [query at: 'fontinfo' put: nil].
	query at: 'glifs' put: ((aGlyphNameCollection
		collect: [:glyphName | glyphName -> nil]) as: Dictionary).
	
	^ self loadQuery: query