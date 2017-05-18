accessing
registerAccountButton

	^ (BTButton text: 'Register new account')
		small;
		when: #clicked send: #openRegisterAccountPage to: self