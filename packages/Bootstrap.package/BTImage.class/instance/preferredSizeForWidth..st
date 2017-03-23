layout
preferredSizeForWidth: aNumber  
	scalingMode == #full ifTrue: [^{self form extent. self form extent}].
	scalingMode == #fill ifTrue: [^{minSize. aNumber @ (self heightAtWidth: aNumber)}].
	scalingMode == #fixed ifTrue: [^{minSize. minSize}].
	scalingMode == #shrink ifTrue: [ | width | 
		width := aNumber min: self form extent x.
		^{minSize. width @ (self heightAtWidth: width)}]