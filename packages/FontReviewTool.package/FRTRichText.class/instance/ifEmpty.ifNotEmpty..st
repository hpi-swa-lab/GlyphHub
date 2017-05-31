testing
ifEmpty: aBlock ifNotEmpty: anotherBlock

	^  (self hasSubmorphs not or: [self paragraphs allSatisfy: [:paragraph | paragraph text isEmpty]]) ifTrue: [aBlock value] ifFalse: [anotherBlock value]