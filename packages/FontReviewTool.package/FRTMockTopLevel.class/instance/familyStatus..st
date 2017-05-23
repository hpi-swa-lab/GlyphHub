mock-data
familyStatus: aFamilyOrId

	| id |
	id := aFamilyOrId isBTModel ifTrue: [aFamilyOrId id] ifFalse: [aFamilyOrId].
		
	^ (FRTFamily load: id populate: #() from: self)
		then: [:family |
			Dictionary newFrom: {
				'error' -> family lastUploadError.
				'status' -> family uploadStatus ifNil: ['ready_for_upload']}]