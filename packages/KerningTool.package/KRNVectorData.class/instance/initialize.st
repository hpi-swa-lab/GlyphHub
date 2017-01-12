initialization
initialize
	| shape |
	super initialize.
	
	transform := MatrixTransform2x3 identity.
	name := (glif attributeAt: #name ifAbsent: [ self error: 'glif name missing, invalid file' ]) asSymbol.
	
	shapes := OrderedCollection new.
	(glif firstTagNamed: #outline) tagsNamed: #contour do: [ :contour |
		shape := self pointsForContour: contour.
		shape ifNotEmpty: [ shapes add: shape asPointArray ]].
	
	self
		computeAdvance;
		computeInitialOutlineFromGlif