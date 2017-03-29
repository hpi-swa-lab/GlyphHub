testing
testWrongPassword
	
	"wenn PW falsch: alert zeigen"
	application openPage usernameField text: 'peter'.
	application openPage passwordField text: 'secret'.
	
	(self expect: application openPage tryLogin) to resolve.
	
	(self expect: application openPage) to be: loginPage.
	(self expect: loginPage loginBox submorphs) to contain: {loginPage loginFailedAlert}