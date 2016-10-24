as yet unclassified
updateExtent
	self font ifNotNil: [
		self extent: self cursorWidth @ (self font height * self scale) ]