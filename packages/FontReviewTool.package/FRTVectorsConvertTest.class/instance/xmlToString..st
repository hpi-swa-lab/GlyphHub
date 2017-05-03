as yet unclassified
xmlToString: aNode

	^ (String streamContents: [:stream | aNode printOn: stream]) contents