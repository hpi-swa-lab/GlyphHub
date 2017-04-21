examples
login

	| loginButton window loader loginBox |
	loginButton := (BTButton label: 'Login') colorType: #primary.
	loginBox := (BTPage new vertical: true; expand: true; align: #(center center))
		add: (BTLabel heading: 'Login to the FONT_WIKI');
		add: (BTTextArea placeholder: 'Username');
		add: (BTPasswordArea placeholder: 'Password');
		add: loginButton;
		primaryFormClickable: loginButton.
	
	loader := BTLoader new align: #(center center); expand: true.
	
	window := BTTopLevel new
		size: 600 asPoint;
		add: loginBox;
		yourself.
	
	loginButton when: #clicked evaluate: [ :event |
		window remove: loginBox; add: loader.
		[	(Delay forSeconds: 1) wait.
			loginBox add: ((BTAlert text: (BTIcon icon: #exclamation_triangle), ' Invalid login provided.') colorType: #danger) at: 2.
			window remove: loader; add: loginBox ] fork ].

	^ window