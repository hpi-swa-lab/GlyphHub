accessing
removeCachedAvatarFor: aUser ifOlderThan: aDateAndTime

	self avatarCache at: aUser id ifPresent: [:promise |
		promise isResolved ifTrue: [
			promise value lastUpdatedAt < aDateAndTime ifTrue: [
				self avatarCache removeKey: aUser id]]]