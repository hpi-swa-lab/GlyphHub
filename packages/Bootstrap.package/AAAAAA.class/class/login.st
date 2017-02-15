as yet unclassified
login
	| loginPage loginButton window loader loginBox |
	loginButton := (BTButton label: 'Login') colorType: #primary.
	loginBox := (BTPage new vertical: true; align: #(center center))
		add: (BTLabel heading: 'Login to the FONT_WIKI');
		add: (BTTextArea placeholder: 'Username');
		add: (BTPasswordArea placeholder: 'Password');
		add: loginButton.
	loginPage := (BTPage new align: #(expand expand)) add: loginBox.
	
	loader := BTLoader new align: #(center center).
	
	window := BTTopLevel new
		size: 600 asPoint;
		add: loginPage;
		yourself.
	
	loginButton do: [
		loginPage remove: loginBox; add: loader.
		[	(Delay forSeconds: 1) wait.
			loginBox add: ((BTAlert text: (BTIcon icon: #exclamation_triangle), ' Invalid login provided.') colorType: #danger) at: 2.
			loginPage remove: loader; add: loginBox ] fork. ].
	
	^window