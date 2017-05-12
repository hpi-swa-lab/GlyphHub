as yet unclassified
testAvatarImageIsDownloaded

	| avatarPromise |
	avatarPromise := user downloadAvatarForm.
	(self expect: avatarPromise) to resolve.
	(self expect: avatarPromise value class) to be: Form.
	(self expect: (FRTUser avatarCache includesKey: user id)) to be: true.

	" read from cache this time "
	(self expect: user downloadAvatarForm) to resolve