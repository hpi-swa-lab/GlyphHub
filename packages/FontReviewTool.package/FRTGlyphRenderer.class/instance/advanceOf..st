helper-drawing
advanceOf: aGlifXMLNode

	^ (aGlifXMLNode firstTagNamed: #advance)
		ifNotNilDo: [:attr | (attr attributeAt: 'width' ifAbsent: [0]) asNumber]
		ifNil: [0]