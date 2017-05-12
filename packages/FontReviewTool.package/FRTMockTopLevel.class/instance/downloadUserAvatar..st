mock-data
downloadUserAvatar: aString

	^ BTPromise unit: (Form extent: FRTUser avatarSize asPoint)