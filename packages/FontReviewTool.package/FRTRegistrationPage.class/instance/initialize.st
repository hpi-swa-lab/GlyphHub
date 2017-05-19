initialize-release
initialize

	super initialize.

	self
		bookmark: (BTPageBookmark page: FRTDashboard);
		initializeRegistrationButton;
		emailField: (BTTextArea placeholder: 'Enter your email address');
		usernameField: (BTTextArea placeholder: 'Enter a username');
		passwordField1: (BTPasswordArea placeholder: 'Enter a password');
		passwordField2: (BTPasswordArea placeholder: 'Enter password again');
		initializeRegistrationBox;
		"loader: (BTLoader new align: #(center center); expand: true);"
		add: self registrationBox;
		yourself