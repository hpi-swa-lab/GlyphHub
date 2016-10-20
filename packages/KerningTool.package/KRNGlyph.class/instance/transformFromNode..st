private
transformFromNode: anXMLElement
	^MatrixTransform2x3 new
		a11: (anXMLElement attributeAt: #xScale ifAbsent: [1]) asNumber;
		a21: (anXMLElement attributeAt: #xyScale ifAbsent: [0]) asNumber;
		a12: (anXMLElement attributeAt: #yxScale ifAbsent: [0]) asNumber;
		a22: (anXMLElement attributeAt: #yScale ifAbsent: [1]) asNumber;
		a13: (anXMLElement attributeAt: #xOffset ifAbsent: [0]) asNumber;
		a23: (anXMLElement attributeAt: #yOffset ifAbsent: [0]) asNumber;
		yourself