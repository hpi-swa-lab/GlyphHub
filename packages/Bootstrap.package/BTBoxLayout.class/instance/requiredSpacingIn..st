as yet unclassified
requiredSpacingIn: aWidget
	^aWidget hasSubmorphs
		ifTrue: [ (aWidget submorphs count: [ :w | w ignoreLayout not ]) - 1 * aWidget spacing ]
		ifFalse: [ 0 ]