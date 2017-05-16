mock-data
availableGlifs

	^ ((#('A' 'a' 'space') collect: [:glyphName | glyphName -> (self mockGlif: glyphName)]), self extraGlifs) as: Dictionary