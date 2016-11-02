as yet unclassified
serialize: aKRNPList
	
	^ String streamContents: [:stream | self serialize: aKRNPList on: stream]