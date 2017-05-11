accessing
avatarCache

	^ AvatarCache ifNil: [self resetAvatarCache]