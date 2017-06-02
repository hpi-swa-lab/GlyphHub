lifecycle
initialize

	super initialize.
	page
		add: ((BTCard header: 'Change Username' content: self initializeChangeUsernameArea)
			align: #(start fill);
			minSize: 400 @ 0);
		add: ((BTCard header: 'Change Password' content: self initializeChangePasswordArea)
			align: #(start fill);
			minSize: 400 @ 0);
		add: ((BTCard header: 'Change Avatar' content: self initializeChangeAvatarArea)
			align: #(start fill);
			minSize: 400 @ 0)