as yet unclassified
testAppendingLineToContour
	| editor oldNumberOfSegments newNumberOfSegments |
	editor := KRNOutlineEditor new.
	editor selectedContour: editor outline submorphs first.
	oldNumberOfSegments := editor outline submorphs first submorphCount.
	
	editor selectedContour canAppendTo ifTrue: [ editor addNewLineSegment: 10 asPoint ].
	newNumberOfSegments := editor outline submorphs first submorphCount.
	
	self assert: (oldNumberOfSegments + 1) equals: newNumberOfSegments.
	self assert: editor outline submorphs first submorphs last isLine equals: true