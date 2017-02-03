as yet unclassified
drawOn: aCanvas
	| bitmap |
	form ifNotNil: [
		| targetForm |
		targetForm := scalingMode caseOf: {
			[#rigid] -> [self formAtExtent: (self innerBounds extent)].
			[#shrink] -> [self formAtExtent: (self innerBounds extent min: form extent)].
			[#fill] -> [self formAtExtent: self innerBounds extent]
		}.
		
		bitmap := (BitmapFillStyle fromForm: targetForm)
			tileFlag: false;
			origin: self innerBounds origin;
			yourself.
		
		BTWidget drawBackgroundOn: aCanvas bounds: self innerBounds colors: ({
			#background -> bitmap.
			#border -> borderColor
		} as: Dictionary) ]
		"aCanvas drawImage: targetForm at: (self innerBounds extent / 2) - (targetForm extent / 2) + self innerBounds origin ]"