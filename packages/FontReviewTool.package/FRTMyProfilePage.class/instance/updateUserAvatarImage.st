lifecycle
updateUserAvatarImage

	self user removeCachedAvatar.
	self user downloadAvatarForm then: [:form | userAvatarImage form: form]