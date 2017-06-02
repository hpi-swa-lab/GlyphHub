mock-data
mockVersionEntryFor: aFamily

	^ FRTFamilyVersionEntry new
		dateAndTime: DateAndTime now;
		family: aFamily;
		message: 'A NEW VERSION';
		versionHash: 'a4bcde98789fa2291f1124412fcd889ae';
		yourself