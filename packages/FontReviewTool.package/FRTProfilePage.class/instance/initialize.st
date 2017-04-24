initialize-release
initialize

	| headingArea changeUsernameArea changePasswordArea |
	super initialize.
	
	newUsernameField := BTTextArea placeholder: 'New Username'.
	newPasswordField1 := BTPasswordArea placeholder: 'New Password'.
	newPasswordField2 := BTPasswordArea placeholder: 'New Password Confirmation'.
	
	changeUsernameArea := BTPage column
		withPadding;
		add: newUsernameField;
		add: ((BTButton label: 'Save')
			colorType: #primary;
			when: #clicked send: #trySavingUsername to: self;
			align: #(end center);
			yourself);
		yourself.
		
	changePasswordArea := BTPage column
		withPadding;
		add: newPasswordField1;
		add: newPasswordField2;
		add: ((BTButton label: 'Save')
			colorType: #primary;
			when: #clicked send: #trySavingPassword to: self;
			align: #(end center);
			yourself);
		yourself.
	
	userAvatarImage := BTImage new
		minSize: 66 asPoint;
		scalingMode: #fixed;
		yourself.
	usernameLabel := BTLabel new align: #(start center).
		
	headingArea := (BTPage row
		add: userAvatarImage;
		add: usernameLabel;
		yourself).
	
	self
		add: headingArea;
		add: ((BTCard header: 'Change Username' content: changeUsernameArea)
			align: #(start fill);
			minSize: 400 @ 0);
		add: ((BTCard header: 'Change Password' content: changePasswordArea)
			align: #(start fill);
			minSize: 400 @ 0)