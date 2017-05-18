open
openUnique

	| app loginPage |
	FRTApplication allInstancesDo: #delete.
	
	app := self open.
	loginPage := app openPage.
	
	loginPage emailField text: 'eve@evil.com'.
	loginPage passwordField text: 'eveisevil'.
	loginPage tryLogin.
	
	^ app openInWindowLabeled: 'Font Review Tool'