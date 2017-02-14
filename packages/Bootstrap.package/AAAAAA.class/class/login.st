as yet unclassified
login
	| loginPage loginButton window loader |
	loginButton := BTButton label: 'Login'.
	loginPage := (BTPage sizing: #(shrinkWrap shrinkWrap) vertical: true)
		add: (BTLabel heading: 'Login to the FONT_WIKI');
		add: (BTTextArea placeholder: 'Username');
		add: (BTPasswordArea placeholder: 'Password');
		add: loginButton.

	loader := BTLoader new.

	window := BTTopLevel new
		alignItems: #(center center);
		size: 600 asPoint;
		add: loginPage;
		yourself.

	loginButton do: [
		window remove: loginPage; add: loader.
		[	(Delay forSeconds: 1) wait.
			loginPage add: ((BTAlert text: (BTIcon icon: #exclamation_triangle), ' Invalid login provided.') colorType: #danger) at: 2.
			window remove: loader; add: loginPage ] fork. ].
	
	^window