geometry
boundsOfGlifs: aGlifXMLCollection

	| minX minY maxX maxY offsetX |
	minX := 0.
	minY := 0.
	maxX := 0.
	maxY := 0.
	offsetX := 0.
	
	aGlifXMLCollection do: [:glif |
		glif tagsNamed: #point do: [:point | | position |
			position := (self coordinatesFromNode: point) + (offsetX @ 0).
			
			minX := minX min: position x.
			minY := minY min: position y.
			maxX := maxX max: position x.
			maxY := maxY max: position y].
		
		offsetX := offsetX + (self advanceOf: glif).
		
		glif tagsNamed: #component do: [:component | | offset rectangle |
			offset := (component attributeAt: #xOffset ifAbsent: [0]) asNumber @ (component attributeAt: #yOffset ifAbsent: [0]) asNumber.
			rectangle := (self boundsOfGlifs: {self loadedGlifs at: (component attributeAt: #base)}) translateBy: offset.
			
			minX := minX min: rectangle left.
			minY := minY min: rectangle top.
			maxX := maxX max: rectangle right.
			maxY := maxY max: rectangle bottom]].
		
	^ Rectangle origin: minX @ minY corner: maxX @ maxY