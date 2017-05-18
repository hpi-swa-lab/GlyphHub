as yet unclassified
initialize

	super initialize.

	self
		redirectPage: {FRTFamilyOverviewPage new. nil};
		initializeRegistrationButton;
		emailField: (BTTextArea placeholder: 'Enter your email address');
		usernameField: (BTTextArea placeholder: 'Enter a username');
		passwordField1: (BTPasswordArea placeholder: 'Enter a password');
		passwordField2: (BTPasswordArea placeholder: 'Enter password again');
		initializeRegistrationBox;
		"loader: (BTLoader new align: #(center center); expand: true);"
		"loginFailedAlert: ((BTAlert text: (BTIcon icon: #exclamation_triangle), ' Something went wrong') colorType: #danger);"
		add: self registrationBox