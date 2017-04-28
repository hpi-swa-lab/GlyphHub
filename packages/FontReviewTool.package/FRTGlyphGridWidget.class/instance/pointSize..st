accessing
pointSize: aNumber

	pointSize := aNumber.
	
	self submorphsDo: [:glyph | glyph pointSize: aNumber]