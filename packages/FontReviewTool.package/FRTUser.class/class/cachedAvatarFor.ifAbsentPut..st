accessing
cachedAvatarFor: aUser ifAbsentPut: aBlock

	self avatarCache at: aUser ifAbsentPut: aUser