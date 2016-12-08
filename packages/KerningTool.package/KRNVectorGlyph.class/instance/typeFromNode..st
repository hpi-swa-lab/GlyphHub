private
typeFromNode: anXMLElement
	^anXMLElement attributeAt: #type ifAbsent: [ #offcurve ]