*bootstrap-promises
isApplicationError
	" determine whether this error corresponds to a possibly expected failure in the application domain and does not represent a bug.
	  e.g. the server not accepting the user's input would be an application error, a MessageNotUnderstood however is not "
	
	^ false