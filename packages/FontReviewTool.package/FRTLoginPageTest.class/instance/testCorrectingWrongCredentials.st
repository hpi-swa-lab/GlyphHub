testing
testCorrectingWrongCredentials
	
	application openPage usernameField text: 'karl'.
	application openPage passwordField text: 'geheim'.
	
	(self expect: application openPage tryLogin) to resolve.
	
	(self expect: application openPage) to be: loginPage.
	(self expect: loginPage loginBox submorphs) to contain: {loginPage loginFailedAlert}.

	
	application openPage usernameField text: 'peter'.
	application openPage passwordField text: 'geheim'.
	
	(self expect: application openPage tryLogin) to resolve.
	
	(self expect: application openPage) to not be: loginPage.
	(self expect: loginPage loginBox submorphs) to not contain: {loginPage loginFailedAlert}