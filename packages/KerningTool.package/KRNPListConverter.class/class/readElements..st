as yet unclassified
readElements: aXMLNode
	
	aXMLNode elements do: [ :element |
		self readElement: element.
	]

	