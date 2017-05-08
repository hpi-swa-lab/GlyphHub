as yet unclassified
ifEmpty: aBlock

	^  (self hasSubmorphs not or: [self paragraphs allSatisfy: [:paragraph | paragraph text isEmpty]]) ifTrue: [aBlock value]