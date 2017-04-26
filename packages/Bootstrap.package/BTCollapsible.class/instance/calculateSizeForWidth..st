layout
calculateSizeForWidth: aNumber  
	| fullSize |
	fullSize := animating or: [collapsed not].
	
	^ container hasSubmorphs
		ifFalse: [ | size |
			size := aNumber + self paddingAsPoint x @ 0.
			{size. size} ]
		ifTrue: [ | preferred |
			preferred := (container firstSubmorph preferredSizeForWidth: aNumber) + self paddingAsPoint.
			fullSize
				ifTrue: [preferred]
				ifFalse: [BTSizeRequest min: preferred minSize x @ 0 natural: preferred minSize y @ 0]]