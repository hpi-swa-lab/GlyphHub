initialize-release
logoutCurrentUser

	(self backend logout)
		then: [
			self user: nil.
			self openPage: FRTLoginPage new with: nil.
			self showSidebar: false.
			self showHeader: false]