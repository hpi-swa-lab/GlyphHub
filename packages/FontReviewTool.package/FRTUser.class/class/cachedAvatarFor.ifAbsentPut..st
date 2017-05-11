accessing
cachedAvatarFor: aUser ifAbsentPut: aBlock

	^ self avatarCache at: aUser id ifAbsentPut: aBlock