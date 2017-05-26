as yet unclassified
loadAllGlifs

	| query |
	query := Dictionary newFrom: {'glifs' -> nil}.
	fontinfo ifNil: [query at: 'fontinfo' put: nil].
	
	^ self loadQuery: query