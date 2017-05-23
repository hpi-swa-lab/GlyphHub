callback
saveFamilySettings

	^ (self family familyName ~= familyName text or: [self family about ~= aboutFamilyText text])
		ifTrue: [
			self family
				familyName: familyName text;
				about: aboutFamilyText text;
				save]
		ifFalse: [BTPromise unit: true]