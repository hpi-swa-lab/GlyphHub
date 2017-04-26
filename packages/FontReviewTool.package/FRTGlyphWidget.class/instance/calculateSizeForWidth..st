geometry
calculateSizeForWidth: aNumber
	
	| min |
	self isReady ifFalse: [^ BTSizeRequest fixed: self minSize].
	
	min := (renderer extentOf: self glyphNames size: self pointSize) max: self minSize.
	
	self square ifTrue: [min := (min x max: min y) asPoint].
	
	^ BTSizeRequest fixed: min