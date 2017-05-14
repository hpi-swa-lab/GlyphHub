as yet unclassified
buildTransform

	| transform |
	"(aPoint x @ (self ascender - aPoint y)) / self unitsPerEm * self pointSize"
	"transform := ((MatrixTransform2x3 withScale: 1 @ -1) composedWithGlobal:
		(MatrixTransform2x3 withOffset: 0 @ self ascender)) composedWithGlobal:
		(MatrixTransform2x3 withScale: (self unitsPerEm * self pointSize))."
		
	transform := (MatrixTransform2x3 withOffset: 0 @ self ascender negated) composedWithGlobal:
		(MatrixTransform2x3 withScale: (self pointSize / self unitsPerEm * BTWidget scalingFactor) asPoint * (1 @ -1)).
	
	self transform: transform inverse: transform inverseTransformation