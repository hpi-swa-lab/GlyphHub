as yet unclassified
testAppendingToContour
	| editor oldNumberOfSegments newNumberOfSegments |
	editor := KRNOutlineEditor new.
	editor selectedContour: editor outline submorphs first.
	oldNumberOfSegments := editor outline submorphs first submorphCount.
	
	editor selectedContour canAppendTo ifTrue: [ editor addNewSegment: 10 asPoint ].
	newNumberOfSegments := editor outline submorphs first submorphCount.
	
	self assert: (oldNumberOfSegments + 1) equals: newNumberOfSegments.
	self assert: editor outline submorphs first submorphs last isCurve equals: true