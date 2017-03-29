testing
testNonExistingUser
	
	"wenn user nicht existiert: alert zeigen"
	application openPage usernameField text: 'karl'.
	application openPage passwordField text: 'geheim'.
	
	(self expect: application openPage tryLogin) to resolve.
	
	(self expect: application openPage) to be: loginPage.
	(self expect: loginPage loginBox submorphs) to contain: {loginPage loginFailedAlert}