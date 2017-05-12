accessing
removeCachedAvatarFor: aUser

	self avatarCache removeKey: aUser id ifAbsent: []