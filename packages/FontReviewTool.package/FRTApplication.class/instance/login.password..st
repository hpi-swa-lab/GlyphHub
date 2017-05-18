actions
login: anEmailString password:  aPasswordString

	^ ((self backend login: anEmailString password: aPasswordString)
		then: [:userId | FRTUser load: userId populate: #() from: self backend])
		then: [:user |
			self
				user: user;
				showSidebar: true;
				showHeader: true]