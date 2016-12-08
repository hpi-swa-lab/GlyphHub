accessing
ptSize: aNumber
	super ptSize: aNumber.
	
	components do: [ :glyph | glyph ptSize: aNumber ].
	self
		updateExtent;
		computeOutline