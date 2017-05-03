callback
trySavingUsername

	newUsernameField text
		ifNotEmpty: [
			self user username: newUsernameField text.
			((self user saveTo: self backend)
				then: [:data | self topLevel displayNotification: 'Username changed' type: #success])
				catch: [:error | self topLevel displayNotification: 'An error occured, username not changed' type: #danger]]
		ifEmpty: [self topLevel displayNotification: 'Username can''t be empty' type: #danger].
	
	self user: self user.
	self topLevel user: self topLevel user.
	self flag: #TODO "update this when model consistency is updated"