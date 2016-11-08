writing
serialize: aKRNPList
	
	^ String streamContents: [:stream | self serialize: aKRNPList on: stream]