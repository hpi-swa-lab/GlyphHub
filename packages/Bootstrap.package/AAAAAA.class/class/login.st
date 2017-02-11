as yet unclassified
login
	| loginPage loginButton window loader |
	loginButton := BTButton label: 'Login'.
	loginPage := BTPage fit
		add: (BTLabel heading: 'Login to the FONT_WIKI');
		add: (BTTextArea placeholder: 'Username');
		add: (BTTextArea placeholder: 'Password');
		add: loginButton.

	loader := BTLoader new.

	window := BTPage topLevel
		listCentering: #center;
		wrapCentering: #center;
		size: 600 asPoint;
		add: loginPage;
		yourself.

	loginButton do: [
		window remove: loginPage; add: loader.
		[	(Delay forSeconds: 1) wait.
			loginPage add: ((BTAlert text: (BTIcon icon: #exclamation_triangle), ' Invalid login provided.') colorType: #danger) at: 2.
			window remove: loader; add: loginPage ] fork. ].
	
	^window