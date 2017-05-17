as yet unclassified
fromJson: aDictionary font: aFont

	^ self new
		font: aFont;
		versionHash: (aDictionary at: 'version_hash');
		message: (aDictionary at: 'message');
		"dateAndTime: (DateAndTime fromString: (aDictionary at: 'datetime'));"
		yourself