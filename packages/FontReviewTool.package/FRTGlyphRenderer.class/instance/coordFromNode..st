helper-contours
coordFromNode: anXMLElement

	^ (anXMLElement attributeAt: #x) asNumber @ (anXMLElement attributeAt: #y) asNumber