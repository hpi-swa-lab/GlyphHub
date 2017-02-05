as yet unclassified
updatePlaceholder
	self text ifEmpty: [
		self internalText: '<span color="#ccc">', self placeholder, '</span>' ]