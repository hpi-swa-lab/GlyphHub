initialize-release
initializeLoginButton
		
	self loginButton: ((BTButton label: 'Login')
		colorType: #primary;
		when: #clicked send: #tryLogin to: self;
		align: #(end end)
		yourself)