initialize-release
initialize

	super initialize.

	self
		bookmark: (BTPageBookmark pageClass: FRTDashboard);
		initializeRegistrationButton;
		emailField: (BTTextArea placeholder: 'Enter your email address');
		usernameField: (BTTextArea placeholder: 'Enter a username');
		passwordField1: (BTPasswordArea placeholder: 'Enter a password');
		passwordField2: (BTPasswordArea placeholder: 'Enter password again');
		initializeRegistrationBox;
		add: self registrationBox;
		yourself