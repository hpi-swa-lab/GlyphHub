drawing
drawOn: aCanvas at: aPoint color: aColor
	" FIXME we would like to directly paint on the canvas, but we get all sorts
	  of problems with colors being wrong if we do that. this is a workaround. "
	| form canvas |
	form := Form extent: self extent depth: 32.
	canvas := FormCanvas on: form.
	
	self outline drawOn: canvas at: (0 @ self font ascender * self scale) floor color: aColor.
	components do: [ :glyph | glyph drawOn: canvas at: glyph transform offset color: aColor ].
	
	aCanvas translucentImage: form at: self innerBounds origin