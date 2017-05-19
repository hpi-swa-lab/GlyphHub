initialize-release
initializeLoginBox

	self loginBox: ((BTPage column expand: true; align: #(center center))
		add: (BTLabel heading: 'Login to the Font Review Tool');
		add: self emailField;
		add: self passwordField;
		add: self loginButton;
		primaryFormClickable: self loginButton;
		add: BTWidget spacer;
		add: (BTPage row
			add: (BTLabel bold: 'Don''t have an account yet?')
			oppositeTo: self registerAccountButton;
			yourself);
		yourself)