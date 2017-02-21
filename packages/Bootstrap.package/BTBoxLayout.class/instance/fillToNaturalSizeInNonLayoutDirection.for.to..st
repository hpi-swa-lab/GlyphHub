as yet unclassified
fillToNaturalSizeInNonLayoutDirection: aCollection for: aWidget to: aSize
	aCollection do: [ :sizes |
		sizes at: 1 put: (aWidget vertical
			ifTrue:  [ (sizes second x clampLow: sizes first x high: aSize x) @ sizes first y ]
			ifFalse: [ sizes first x @ (sizes second y clampLow: sizes first y high: aSize y) ]) ]