open
openLoggedIn

	| app loginPage |
	app := self open.
	loginPage := app openPage.
	
	loginPage emailField text: 'eve@evil.com'.
	loginPage passwordField text: 'eveisevil'.
	loginPage tryLogin.
	
	^ app