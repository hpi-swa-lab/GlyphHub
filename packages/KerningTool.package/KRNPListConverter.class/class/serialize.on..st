writing
serialize: aKRNPList on: aStream
	
	| writer |
	writer := KRNXMLPListWriter on: aStream.
	writer indentTab.
	writer stream nextPutAll: self pListStart.
	aKRNPList pListWriteOn: writer