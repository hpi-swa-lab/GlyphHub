initialize-release
initialize

	super initialize.

	self
		bookmark: (BTPageBookmark page: FRTDashboard);
		initializeLoginButton;
		emailField: (BTTextArea placeholder: 'Email');
		passwordField: (BTPasswordArea placeholder: 'Password');
		initializeLoginBox;
		loader: (BTLoader new align: #(center center); expand: true);
		loginFailedAlert: ((BTAlert text: (BTIcon icon: #exclamation_triangle), ' Invalid login provided.') colorType: #danger);
		add: self loginBox