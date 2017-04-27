layout
calculateSizeForWidth: aNumber

	self form ifNil: [^ {minSize. minSize}].
	
	scalingMode == #full ifTrue: [^ BTSizeRequest fixed: self form extent].
	scalingMode == #fill ifTrue: [^ BTSizeRequest min: minSize natural: aNumber @ (self heightAtWidth: aNumber)].
	scalingMode == #fixed ifTrue: [^ BTSizeRequest fixed: minSize].
	scalingMode == #shrink ifTrue: [ | width |
		width := aNumber min: self form extent x.
		^ BTSizeRequest min: minSize natural: width @ (self heightAtWidth: width)].
	
	^ self error: 'Unsupported scalingMode'