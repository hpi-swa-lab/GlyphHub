drawing
draw: aFlyweight on: aCanvas at: aPoint color: aColor
	" FIXME we would like to directly paint on the canvas, but we get all sorts
	  of problems with colors being wrong if we do that. this is a workaround. "
	| form canvas |
	form := Form extent: aFlyweight extent depth: 32.
	canvas := FormCanvas on: form.
	
	(aFlyweight renderDataAt: #outline) drawOn: canvas at: (0 @ aFlyweight font ascender * aFlyweight scale) floor color: aColor.
	(aFlyweight renderDataAt: #components) do: [ :component | component drawOn: canvas at: (0 @ aFlyweight font ascender * aFlyweight  scale) floor color: aColor].

	aCanvas translucentImage: form at: aPoint