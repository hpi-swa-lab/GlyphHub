as yet unclassified
coordinatesFromNode: anXMLElement

	^ (anXMLElement attributeAt: #x) asNumber @ (anXMLElement attributeAt: #y) asNumber