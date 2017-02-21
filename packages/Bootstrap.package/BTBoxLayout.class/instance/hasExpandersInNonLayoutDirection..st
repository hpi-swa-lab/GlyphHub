as yet unclassified
hasExpandersInNonLayoutDirection: aWidget
	^(aWidget wantsExpandIn: aWidget vertical) at: (aWidget vertical ifTrue: [1] ifFalse: [2])