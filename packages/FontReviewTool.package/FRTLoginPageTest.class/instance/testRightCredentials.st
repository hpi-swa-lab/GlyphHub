testing
testRightCredentials
	
	"wenn cred richtig: neue page anzeigen"
	application openPage usernameField text: 'peter'.
	application openPage passwordField text: 'geheim'.
	"self mouseClick: application openPage loginButton buttons: #(left)."
	(self expect: application openPage tryLogin) to resolve.
	
	(self expect: application openPage) to not be: loginPage.
	(self expect: loginPage loginBox submorphs) to not contain: {loginPage loginFailedAlert}