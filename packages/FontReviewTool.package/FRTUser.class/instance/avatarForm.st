accessing
avatarForm

	^ self downloadAvatar
		then: [self class AvatarCache at: self id]