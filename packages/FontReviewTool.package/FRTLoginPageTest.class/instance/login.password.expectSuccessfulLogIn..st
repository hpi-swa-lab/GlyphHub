testing
login: aUserNameString password: aPasswordString expectSuccessfulLogIn: aBoolean
	
	| loginPromise |
	application openPage usernameField text: aUserNameString.
	application openPage passwordField text: aPasswordString.
	application openPage redirectPage: {BTApplicationPage new. nil}.
	
	loginPromise := self safePromise: application openPage tryLogin.  
	
	(self expect: loginPromise) to resolve.
	
	(self expect: application openPage) to negated: aBoolean; be: loginPage.
	(self expect: loginPage loginBox submorphs) to negated: aBoolean; contain: {loginPage loginFailedAlert}