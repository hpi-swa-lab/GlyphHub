as yet unclassified
serialize: aKRNPList
	
	| writer |
	writer := XMLWriter on: (WriteStream on: String new).
	writer stream nextPutAll: self pListStart.
	aKRNPList pListWriteOn: writer.
	^ writer stream contents