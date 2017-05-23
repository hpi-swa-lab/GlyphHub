mock-data
upload: aStream toFamily: aFamilyOrId commitMessage: aString

	id := aFamilyOrId isBTModel ifTrue: [aFamilyOrId id] ifFalse: [aFamilyOrId].
	
	^ (FRTFamily load: id populate: #() from: self)
		then: [:family | family uploadStatus: 'processing'; save]