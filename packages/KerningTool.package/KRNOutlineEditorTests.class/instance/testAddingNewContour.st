as yet unclassified
testAddingNewContour
	| editor newNumberOfContours oldNumberOfContours |
	editor := KRNOutlineEditor new.
	editor selectedContour: KRNNullContour new.
	oldNumberOfContours := editor outline submorphCount.
	
	editor selectedContour canAppendTo ifFalse: [ editor addNewContour: 10 asPoint ].
	newNumberOfContours := editor outline submorphCount.
	
	self assert: (oldNumberOfContours + 1) equals: newNumberOfContours