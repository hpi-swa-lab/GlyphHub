accessing
versionMessages: aCollection
	" this field can't be mutated on the server, so avoid setting its dirty flag "
	
	versionMessages := aCollection
		ifNotNil: [aCollection collect: [:dictionaryOrVersion |
				dictionaryOrVersion isDictionary
					ifTrue: [FRTFamilyVersionEntry fromJson: dictionaryOrVersion family: self]
					ifFalse: [dictionaryOrVersion]]]
		ifNil: [#()]