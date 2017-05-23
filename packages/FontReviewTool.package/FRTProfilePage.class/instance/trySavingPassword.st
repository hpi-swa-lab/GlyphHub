callback
trySavingPassword

	newPasswordField1 text
		ifNotEmpty: [
			newPasswordField1 text = newPasswordField2 text
				ifTrue: [
					self user password: newPasswordField1 text.
					^ ((self user saveTo: self backend)
						then: [self topLevel displayNotification: 'Password changed' type: #success])
						catch: [self topLevel displayNotification: 'An error occured, password not changed' type: #warning]]
				ifFalse: [self topLevel displayNotification: 'Passwords don''t match' type: #warning]]
		ifEmpty: [self topLevel displayNotification: 'Password can''t be empty' type: #warning].
		
	^ BTPromise new rejectWith: nil