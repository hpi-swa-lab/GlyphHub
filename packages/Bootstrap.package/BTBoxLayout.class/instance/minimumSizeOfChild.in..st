as yet unclassified
minimumSizeOfChild: aWidget in: newBounds
	^aWidget heightForWidth
		ifTrue: [ aWidget minSizeForWidth: newBounds width ]
		ifFalse: [ aWidget minSize ]