as yet unclassified
preferredSizeFor: aWidget width: aNumber

	| n columns rows |
	aWidget hasSubmorphs ifFalse: [^ {0 asPoint. 0 asPoint}].
	
	n := aWidget submorphCount.
	columns := (aNumber / cellSize x) floor.
	rows := (n / columns) ceiling.
	
	^ {cellSize x @ (cellSize y * n). (columns min: n) @ rows * cellSize}