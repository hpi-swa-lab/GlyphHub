as yet unclassified
contourXMLFrom: aString

	^ (XMLDOMParser parseDocumentFrom: aString readStream) firstTagNamed: #contour