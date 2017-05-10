accessing
avatarPath

	^ (self backend avatarExistsFor: self)
		then: [:avatarExists | avatarExists
			ifTrue: 
				[(self backend isAvatarCacheUpToDate)
					then: [:cacheIsUpToDate | cacheIsUpToDate
						ifTrue: [self class customAvatarDefaultDirectoty / (self id asString, '.jpg')]
						ifFalse:
							[(self backend downloadAvatar)
								then: [self class customAvatarDefaultDirectoty / (self id asString, '.jpg')]]]]
			ifFalse: [FileDirectory default / 'BP2016H1' / 'media' / 'default_avatar.jpg']]
			

	