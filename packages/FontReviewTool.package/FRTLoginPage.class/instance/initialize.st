initialize-release
initialize

	super initialize.

	self
		redirectPage: FRTProjectOverviewPage new;
		loginButton: ((BTButton label: 'Login')
			colorType: #primary;
			when: #clickedNoEvent send: #tryLogin to: self;
			yourself);
		usernameField: (BTTextArea placeholder: 'Username');
		passwordField: (BTPasswordArea placeholder: 'Password');
		loginBox: ((BTPage new vertical: true; expand: true; align: #(center center))
			add: (BTLabel heading: 'Login to the Font Review Tool');
			add: self usernameField;
			add: self passwordField;
			add: self loginButton;
			primaryFormClickable: self loginButton;
			yourself);
		loader: (BTLoader new align: #(center center); expand: true);
		loginFailedAlert: ((BTAlert text: (BTIcon icon: #exclamation_triangle), ' Invalid login provided.') colorType: #danger);
		add: self loginBox