callback
trySavingAvatar

	self imageFileStream
		ifNotNil: [
			((self backend uploadAvatar: self imageFileStream)
				then: [:data |
					self updateUserAvatarImage.
					self imageFileStream: nil.
					self topLevel
						updateSidebarUserAvatarImage;
						displayNotification: 'Avatar changed' type: #success])
				catch: [:error | self topLevel displayNotification: 'An error occured, avatar not changed' type: #warning]]
		ifNil: [self topLevel displayNotification: 'Please choose image file' type: #warning]