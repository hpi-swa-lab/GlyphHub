helper-contours
coordinatesFromNode: anXMLElement

	^ (anXMLElement attributeAt: #x) asNumber @ (anXMLElement attributeAt: #y) asNumber