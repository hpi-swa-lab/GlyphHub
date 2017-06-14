as yet unclassified
enteringWith: unused

	(self backend load: 1 into: FRTFont populate: self fontFields)
		then: [:loadedFont |
			font := loadedFont.
			textEntry visible: true]