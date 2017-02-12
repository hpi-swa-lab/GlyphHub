as yet unclassified
moveToNextWord: direction selecting: aBoolean
	self cursor: (self indexForNextWord: direction).
	aBoolean ifFalse: [ self selectionBound: self cursor ]