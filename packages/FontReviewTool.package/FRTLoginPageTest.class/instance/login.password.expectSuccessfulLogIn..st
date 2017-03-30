testing
login: aUserNameString password: aPasswordString expectSuccessfulLogIn: aBoolean
	application openPage usernameField text: aUserNameString.
	application openPage passwordField text: aPasswordString.
	
	(self expect: application openPage tryLogin) to resolve.
	
	(self expect: application openPage) to negated: aBoolean; be: loginPage.
	(self expect: loginPage loginBox submorphs) to negated: aBoolean; contain: {loginPage loginFailedAlert}