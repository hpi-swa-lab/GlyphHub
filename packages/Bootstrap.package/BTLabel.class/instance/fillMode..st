as yet unclassified
fillMode: aMode
	" one of #fill, #shrink, #fixed "
	fillMode := aMode.

	self
		hResizing: (aMode = #fill ifTrue: [#spaceFill] ifFalse: [#shrinkWrap]);
		vResizing: #shrinkWrap