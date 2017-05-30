actions
logoutCurrentUser

	^ (self backend logout
		then: [
			self
				user: nil;
				openPage: FRTLoginPage new;
				showSidebar: false;
				showHeader: false])
		catch: [:error | self topLevel displayNotification: 'Failed to logout!' type: #danger]