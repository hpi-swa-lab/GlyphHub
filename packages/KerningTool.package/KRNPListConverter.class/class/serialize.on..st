as yet unclassified
serialize: aKRNPList on: aStream
	
	| writer |
	writer := XMLWriter on: aStream.
	writer stream nextPutAll: self pListStart.
	aKRNPList pListWriteOn: writer