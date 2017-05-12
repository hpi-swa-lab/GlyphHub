testing
login: aUserNameString password: aPasswordString expectSuccessfulLogIn: aBoolean
	
	| loginPromise |
	page usernameField text: aUserNameString.
	page passwordField text: aPasswordString.
	page redirectPage: {BTApplicationPage new. nil}.
	
	loginPromise := self safePromise: page tryLogin.  
	
	(self expect: loginPromise) to resolve.
	
	(self expect: self topLevel openPage) to negated: aBoolean; be: page.
	(self expect: page loginBox submorphs) to negated: aBoolean; contain: {page loginFailedAlert}