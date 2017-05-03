accessing
typeSymbol

	^ self type caseOf: {
		[1] -> [#picture].
		[2] -> [#file].
		[3] -> [#outline].
		[4] -> [#outlineDiff]
	}