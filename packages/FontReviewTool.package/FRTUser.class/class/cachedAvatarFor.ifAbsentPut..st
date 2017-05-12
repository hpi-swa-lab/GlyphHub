accessing
cachedAvatarFor: aUser ifAbsentPut: aBlock

	^ (self avatarCache at: aUser id ifAbsentPut: [ 
		((aBlock value
			then: [:form | FRTCachedAvatar for: aUser form: form])
			catch: [self removeCachedAvatarFor: aUser])]) then: #form