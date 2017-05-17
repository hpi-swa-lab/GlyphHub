callbacks
downloadOtf

	| directory |
	directory := UIManager default chooseDirectory: 'Choose a directory'.
	((self backend downloadFontOtf: self font into: directory named: self font fontName)
		then: [self topLevel displayNotification: 'Download successful' type: #success ])
		catch: [self topLevel displayNotification: 'Download failed' type: #warning]