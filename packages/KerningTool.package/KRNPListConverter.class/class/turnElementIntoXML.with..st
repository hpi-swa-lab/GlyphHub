as yet unclassified
turnElementIntoXML: aKRNElement with: anXMLWriter

	aKRNElement isInteger ifTrue: [ self write: 694 inTag: #integer on: anXMLWriter].
	^ anXMLWriter stream contents