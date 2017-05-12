as yet unclassified
setUp

	FRTUser resetAvatarCache.
	
	self setUpWithoutPagePrepare: [:topLevel |
		topLevel addEntity: (user := self mockUser)]