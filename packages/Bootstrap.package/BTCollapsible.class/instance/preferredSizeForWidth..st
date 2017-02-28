as yet unclassified
preferredSizeForWidth: aNumber  
	| fullSize |
	fullSize := animating or: [collapsed not].
	
	^container hasSubmorphs
		ifFalse: [ | size |
			size := aNumber + self paddingAsPoint x @ 0.
			{size. size} ]
		ifTrue: [ | preferred |
			preferred := (container firstSubmorph preferredSizeForWidth: aNumber) + self paddingAsPoint.
			fullSize
				ifTrue: [preferred]
				ifFalse: [{preferred first x @ 0. preferred first y @ 0}]]