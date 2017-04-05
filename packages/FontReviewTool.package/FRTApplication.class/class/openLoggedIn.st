open
openLoggedIn

	| app loginPage |
	app := self open.
	loginPage := app openPage.
	
	loginPage usernameField text: 'Eva'.
	loginPage passwordField text: 'eveisevil'.
	loginPage tryLogin.
	
	^ app