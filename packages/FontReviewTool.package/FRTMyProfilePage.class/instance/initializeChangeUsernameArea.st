lifecycle
initializeChangeUsernameArea

	newUsernameField := BTTextArea placeholder: 'New Username'.
	^ BTPage column
		withPadding;
		add: newUsernameField;
		add: ((BTButton label: 'Save')
			colorType: #primary;
			when: #clicked send: #trySavingUsername to: self;
			align: #(end center);
			yourself);
		yourself