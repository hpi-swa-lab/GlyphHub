drawing
drawOn: aCanvas
	| bitmap |
	form ifNotNil: [
		| targetForm |
		targetForm := scalingMode caseOf: {
			[#full] -> [self formAtExtent: self form extent].
			[#fixed] -> [self formAtExtent: (self innerBounds extent)].
			[#shrink] -> [self formAtExtent: (self innerBounds extent min: form extent)].
			[#fill] -> [self formAtExtent: self innerBounds extent]}.
		
		self hasFrame
			ifTrue: [
				bitmap := (BitmapFillStyle fromForm: targetForm)
					tileFlag: false;
					origin: self innerBounds origin;
					yourself.
				
				BTWidget
					drawBackgroundOn: aCanvas
					bounds: (self position extent: targetForm extent)
					colors: (self colorScheme background: bitmap)]
			ifFalse: [aCanvas translucentImage: targetForm at: self position]]