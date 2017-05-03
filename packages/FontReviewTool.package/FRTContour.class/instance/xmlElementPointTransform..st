as yet unclassified
xmlElementPointTransform: aBlock

	| element |
	element := XMLElement named: 'contour'.

	self closed ifFalse: [
		element addElement: (self xmlMoveElementPointTransform: aBlock)].

	(self elements gather: [:curve | curve xmlElementsPointTransform: aBlock])
		do: [:point | element addElement: point].

	" to restore the the same order of nodes we had when converting, cycle the elements if required "
	cycleWhenSaving timesRepeat: [
		element elementsAndContents addFirst: element elementsAndContents removeLast].

	^ element