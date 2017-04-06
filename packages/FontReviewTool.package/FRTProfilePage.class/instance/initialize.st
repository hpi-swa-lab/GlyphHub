as yet unclassified
initialize

	| headingArea changeUsernameArea changePasswordArea |
	super initialize.
	
	changeUsernameArea := BTPage column
		withPadding;
		add: (BTTextArea placeholder: 'New Username');
		add: (BTButton label: 'Save');
		yourself.
		
	changePasswordArea := BTPage column
		withPadding;
		add: (BTPasswordArea placeholder: 'New Password');
		add: (BTPasswordArea placeholder: 'New Password Confirmation');
		add: (BTButton label: 'Save');
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