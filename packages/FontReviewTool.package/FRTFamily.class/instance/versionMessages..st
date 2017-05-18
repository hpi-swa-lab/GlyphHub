accessing
versionMessages: aCollection
	" this field can't be mutated on the server, so avoid setting its dirty flag "
	
	versionMessages := aCollection
		ifNotNil: [aCollection collect: [:dictionary | FRTFamilyVersionEntry fromJson: dictionary family: self]]
		ifNil: [#()]