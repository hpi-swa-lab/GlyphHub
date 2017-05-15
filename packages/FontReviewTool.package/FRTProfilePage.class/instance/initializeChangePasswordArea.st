initialize-release
initializeChangePasswordArea

	newPasswordField1 := BTPasswordArea placeholder: 'New Password'.
	newPasswordField2 := BTPasswordArea placeholder: 'New Password Confirmation'.

	^ BTPage column
		withPadding;
		add: newPasswordField1;
		add: newPasswordField2;
		add: ((BTButton label: 'Save')
			colorType: #primary;
			when: #clicked send: #trySavingPassword to: self;
			align: #(end center);
			yourself);
		yourself