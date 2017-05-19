initialize-release
initializeRegistrationButton

	self registrationButton: ((BTButton text: 'Register new account')
		colorType: #primary;
		when: #clicked send: #tryRegisterNewUser to: self;
		align: #(end end))