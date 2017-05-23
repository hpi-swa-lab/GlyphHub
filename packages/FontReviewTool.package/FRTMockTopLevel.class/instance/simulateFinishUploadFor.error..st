mock-data
simulateFinishUploadFor: aFamilyOrId error: aString

	id := aFamilyOrId isBTModel ifTrue: [aFamilyOrId id] ifFalse: [aFamilyOrId].
	
	^ (FRTFamily load: id populate: #() from: self)
		then: [:family |
			aString ifNil: [
				family fonts add: (FRTFont new
					fontName: family familyName, ' Regular';
					author: self user)].
			family
				uploadStatus: 'ready_for_upload';
				lastUploadError: aString;
				save]