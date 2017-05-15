initialize-release
initialize

	super initialize.
	self
		add: (BTScrollArea new add: (BTPage column
			add: self initializeHeadingArea;
			add: ((BTCard header: 'Change Username' content: self initializeChangeUsernameArea)
				align: #(start fill);
				minSize: 400 @ 0);
			add: ((BTCard header: 'Change Password' content: self initializeChangePasswordArea)
				align: #(start fill);
				minSize: 400 @ 0);
			add: ((BTCard header: 'Change Avatar' content: self initializeChangeAvatarArea)
				align: #(start fill);
				minSize: 400 @ 0)))