as yet unclassified
selectedContour: aContour
	self deselectPointFrom: self selectedContour.
	selectedContour := aContour.
	self selectPointFrom: self selectedContour