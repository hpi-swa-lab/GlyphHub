callbacks
downloadOtf

	| directory |
	directory := UIManager default chooseDirectory: 'Choose a directory'.
	self backend downloadFontOtf: self font into: directory named: self font fontName