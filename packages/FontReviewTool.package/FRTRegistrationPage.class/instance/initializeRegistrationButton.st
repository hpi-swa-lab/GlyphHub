as yet unclassified
initializeRegistrationButton

	self registrationButton: ((BTButton text: 'Register new account')
		colorType: #primary;
		when: #clicked send: #tryRegisterNewUser to: self)