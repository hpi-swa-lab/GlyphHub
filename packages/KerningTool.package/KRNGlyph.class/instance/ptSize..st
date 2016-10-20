accessing
ptSize: aNumber
	ptSize := aNumber.
	components do: [ :glyph | glyph ptSize: aNumber ].
	self updateExtent