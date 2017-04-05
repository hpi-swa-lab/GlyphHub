helper-contours
typeFromNode: anXMLElement

	^ anXMLElement attributeAt: #type ifAbsent: [#offcurve]