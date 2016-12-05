initialize-release
updateExtent
	| x y oldBounds delta |
	
	x := (self pointMorphs collect: [ :p | p center x ]) minMax.
	y := (self pointMorphs collect: [ :p | p center y ]) minMax.
	
	oldBounds := bounds copy.
	self position: (x first @ y first); extent: (x second - x first) @ (y second - y first).
	
	delta := bounds origin - oldBounds origin.
	
	self pointMorphs do: [ :p | p position: p position - delta ].
	self
		changed;
		layoutChanged