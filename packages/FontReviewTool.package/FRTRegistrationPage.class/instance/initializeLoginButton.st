initialize-release
initializeLoginButton

	^ BTButton new
		text: 'Login to your Account';
		small;
		when: #clicked send: #openLoginPage to: self