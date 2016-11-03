as yet unclassified
nextLine: aRectangle
	| offset |
	offset := self center	
		ifTrue: [ aRectangle width / 2 - (x - aRectangle left / 2) ]
		ifFalse: [ 0 ].
	
	layoutCache
		do: [ :cached | cached first bounds: (cached second + (offset @ 0) extent: cached first extent) ];
		removeAll.
	
	rowOffsets add: offset.
	
	x := fontProps first x.
	y := y + fontProps third.
	previousGlyph := nil