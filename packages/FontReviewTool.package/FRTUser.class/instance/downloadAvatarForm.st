accessing
downloadAvatarForm
	" returns a promise resolving to the avatar image for this user "

	^ self class cachedAvatarFor: self ifAbsentPut: [
		self backend downloadUserAvatar: self]