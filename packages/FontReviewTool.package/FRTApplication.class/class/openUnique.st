open
openUnique

	| app loginPage |
	FRTApplication allInstancesDo: #delete.
	
	app := self open.
	loginPage := app openPage.
	
	loginPage usernameField text: 'Eva'.
	loginPage passwordField text: 'eveisevil'.
	loginPage tryLogin.
	
	^ app openInWindowLabeled: 'Font Review Tool'