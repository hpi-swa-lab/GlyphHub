geometry
preferredSizeForWidth: aNumber
	
	| min |
	self isReady ifFalse: [^ {self minSize. self minSize}].
	
	min := (renderer extentOf: self glyphNames size: self pointSize) max: self minSize.
	
	self square ifTrue: [min := (min x max: min y) asPoint].
	
	^ {min. min}