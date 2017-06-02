testing
login: anEmailString password: aPasswordString expectSuccessfulLogIn: aBoolean
	
	| loginPromise |
	page emailField text: anEmailString.
	page passwordField text: aPasswordString.
	page bookmark: (BTPageBookmark pageClass: BTApplicationPage).
	
	loginPromise := self safePromise: page tryLogin.  
	
	(self expect: loginPromise) to resolve.
	
	(self expect: self topLevel openPage) to negated: aBoolean; be: page.
	(self expect: page loginBox submorphs) to negated: aBoolean; contain: {page loginFailedAlert}