layout
preferredSizeFor: aWidget width: aNumber

	| n columns rows natSize effectiveCellSize |
	aWidget hasSubmorphs ifFalse: [^ {0 asPoint. 0 asPoint}].
	
	effectiveCellSize := cellSize + aWidget spacing.
	n := aWidget submorphCount.
	
	columns := (aNumber / effectiveCellSize x) floor max: 1.
	" if enough space is left for another cell without spacing, add that "
	aNumber - (columns * effectiveCellSize) >= cellSize
		ifTrue: [columns := columns + 1].
	" if we wouldn't even fill one full row, don't claim all the space "
	columns := columns min: n.
	
	rows := (n / columns) ceiling.
	
	natSize := (columns * effectiveCellSize x) @ (rows * effectiveCellSize y).
	
	^ {	cellSize x @ (effectiveCellSize y * n min: natSize y). natSize}