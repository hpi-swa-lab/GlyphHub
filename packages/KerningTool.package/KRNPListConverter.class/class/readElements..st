reading
readElements: aXMLNode
	
	aXMLNode elements do: [ :element |
		self readElement: element.
	]

	