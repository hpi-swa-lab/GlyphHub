as yet unclassified
drawOn: aCanvas
	| scale |
	scale := self font scaleAtPtSize: self ptSize.
	
	aCanvas translucentImage: self form at: self formOrigin