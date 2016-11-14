as yet unclassified
drawOn: aCanvas
	| scale |
	scale := self font scaleAtPtSize: self ptSize.
	
	aCanvas translucentImage: (self form scaledIntoFormOfSize: self form extent * scale smoothing: 4) at: self innerBounds origin