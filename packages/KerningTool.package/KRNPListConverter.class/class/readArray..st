reading
readArray: aXMLNode
	| array |
	
	array := OrderedCollection new.
	
	aXMLNode elements do: [ :element |
		array add: (self readElement: element).
	].

	^ array