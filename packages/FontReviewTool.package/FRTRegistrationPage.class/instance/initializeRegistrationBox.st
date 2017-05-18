as yet unclassified
initializeRegistrationBox

	self registrationBox: ((BTPage column expand: true; align: #(center center))
		add: (BTLabel heading: 'Register to the Font Review Tool');
		add: self usernameField;
		add: self emailField;
		add: self passwordField1;
		add: self passwordField2;
		add: self registrationButton;
		primaryFormClickable: self registrationButton;
		yourself)