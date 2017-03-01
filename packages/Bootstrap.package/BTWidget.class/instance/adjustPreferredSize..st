layout
adjustPreferredSize: aCollection
	" makes sure minSize and maxSize are adhered to "
	| min natural naturalX naturalY |
	min := aCollection first max: minSize.
	
	natural := aCollection second.
	naturalX := maxSize x < 0 ifTrue: [natural x] ifFalse: [natural x min: maxSize x].
	naturalY := maxSize y < 0 ifTrue: [natural y] ifFalse: [natural y min: maxSize y].
	
	^{min. naturalX @ naturalY max: min}