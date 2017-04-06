callback
trySavingPassword

	newPasswordField1 text
		ifNotEmpty: [
			newPasswordField1 text = newPasswordField2 text
				ifTrue: [
					self user password: newPasswordField1 text.
					((self user saveTo: self topLevel backend)
						then: [:data | self topLevel displayNotification: 'Password changed' type: #success])
					catch: [:error | self topLevel displayNotification: 'An error occured, password not changed' type: #danger]]
				ifFalse: [self topLevel displayNotification: 'Passwords don''t match' type: #danger]]
		ifEmpty: [self topLevel displayNotification: 'Password can''t be empty' type: #danger]