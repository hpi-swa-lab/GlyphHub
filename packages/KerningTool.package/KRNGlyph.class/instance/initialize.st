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
	
	components := OrderedCollection new.
	(glif firstTagNamed: #outline) tagsNamed: #component do: [ :component | | key |
		key := component attributeAt: #base.
		components add: ((KRNGlyph newForXML: (self font glyphAt: key) from: self font)
			transform: (self transformFromNode: component);
			yourself) ].
	
	self
		ptSize: 11;
		color: Color white;
		position: 0 @ 0