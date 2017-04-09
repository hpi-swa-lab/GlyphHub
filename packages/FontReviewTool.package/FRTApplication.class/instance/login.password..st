initialize-release
login: aUserNameString password:  aPasswordString

	^ ((self backend login: aUserNameString password: aPasswordString)
		then: [:userId | FRTUser load: userId from: self backend])
		then: [:user |
			self user: user.
			self showSidebar: true.
			self showHeader: true]