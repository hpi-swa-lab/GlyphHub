accessing
alignment: aSymbol

	alignment := aSymbol.
	
	self primLayout: self layout justify: aSymbol == #justify.
	
	self primLayout: self layout alignment: (aSymbol caseOf: {
		[#justify] -> [0].
		[#left] -> [0].
		[#center] -> [1].
		[#right] -> [2]})