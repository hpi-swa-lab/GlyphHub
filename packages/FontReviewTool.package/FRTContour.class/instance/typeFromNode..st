as yet unclassified
typeFromNode: anXMLElement

	^ (anXMLElement attributeAt: #type ifAbsent: [#offcurve]) asSymbol