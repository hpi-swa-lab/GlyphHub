as yet unclassified
expandsInLayoutDirection: aWidget
	^(aWidget wantsExpandIn: vertical) at: (vertical ifTrue: [2] ifFalse: [1])