as yet unclassified
preferredSizeFor: aWidget width: aNumber

	| n columns rows minColumns natSize |
	aWidget hasSubmorphs ifFalse: [^ {0 asPoint. 0 asPoint}].
	
	n := aWidget submorphCount.
	columns := (aNumber / cellSize x) floor.
	rows := (n / columns) ceiling.
	" try not to fill all the space unless uncessary (case where n < columns) "
	minColumns := columns min: n.
	
	natSize := (minColumns + (minColumns - 1 * aWidget spacing)) @ (rows + (rows - 1 * aWidget spacing)) * cellSize.
	
	^ {	cellSize x @ (cellSize y * n). natSize}.