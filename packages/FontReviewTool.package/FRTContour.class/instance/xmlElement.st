as yet unclassified
xmlElement

	| element |
	element := XMLElement named: 'contour'.

	self closed ifFalse: [
		element addElement: self xmlMoveElement].

	(self elements gather: [:curve | curve xmlElements])
		do: [:point | element addElement: point].

	" to restore the the same order of nodes we had when converting, cycle the elements if required "
	cycleWhenSaving timesRepeat: [
		element elementsAndContents addFirst: element elementsAndContents removeLast].

	^ element