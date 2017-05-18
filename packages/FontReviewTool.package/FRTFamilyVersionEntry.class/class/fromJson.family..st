as yet unclassified
fromJson: aDictionary family: aFamily

	^ self new
		family: aFamily;
		versionHash: (aDictionary at: 'version_hash');
		message: (aDictionary at: 'message');
		dateAndTime: (DateAndTime fromString: (aDictionary at: 'datetime'));
		yourself