callback
saveSettings

	saveButton disabled: true.
	
	^ ((BTPromise all: {self saveFamilySettings. self saveUserSettings})
		then: [self topLevel displayNotification: 'Settings saved.' type: #info])
		catch: [
			saveButton disabled: false.
			self topLevel displayNotification: 'Saving settings failed!' type: #danger]