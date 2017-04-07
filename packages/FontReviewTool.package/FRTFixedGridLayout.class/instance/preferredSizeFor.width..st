as yet unclassified
preferredSizeFor: aWidget width: aNumber

	| n columns rows |
	n := aWidget submorphCount.
	columns := (aNumber / cellSize x) floor.
	rows := (n / columns) ceiling.
	
	^ {cellSize x @ (cellSize y * n). columns @ rows * cellSize}