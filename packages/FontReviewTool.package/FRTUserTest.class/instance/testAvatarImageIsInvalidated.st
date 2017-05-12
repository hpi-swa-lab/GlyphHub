as yet unclassified
testAvatarImageIsInvalidated

	| currentFormPromise newFormPromise stillCurrentFormPromise |
	currentFormPromise := user downloadAvatarForm.
	(self expect: currentFormPromise) to resolve.

	stillCurrentFormPromise := user downloadAvatarForm.
	(self expect: stillCurrentFormPromise) to resolve.
	(self expect: currentFormPromise value form) to be: stillCurrentFormPromise value form.

	" this updates the user model and thus sets a newer timestamp "
	user username: 'abc'; save.

	" this loads the new user, which should cause the model to note that the updatedAt timestamp should invalidate the cache "
	FRTUser load: user id populate: #() from: self topLevel.

	newFormPromise := user downloadAvatarForm.
	(self expect: newFormPromise) to resolve.

	(self expect: currentFormPromise value) to not be: newFormPromise value