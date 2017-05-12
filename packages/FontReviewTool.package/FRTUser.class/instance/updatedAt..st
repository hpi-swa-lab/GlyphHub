accessing
updatedAt: aDateAndTimeOrString.

	super updatedAt: aDateAndTimeOrString.
	
	self class removeCachedAvatarFor: self ifOlderThan: self updatedAt