as yet unclassified
parseGlif: aGlifXMLOrNil

	^ aGlifXMLOrNil
		ifNotNil: [XMLDOMParser parseDocumentFrom: aGlifXMLOrNil readStream]
		ifNil: [self emptyGlif]