testing
allFieldsFilled

	^ ((self usernameField text isEmpty or: [self passwordField1 text isEmpty]) or: [self emailField text isEmpty]) not