callback
leaving

	^ (saveButton disabled not and:
		[(self topLevel confirm: 'You have unsaved changes, leave the page anyway?') not])
		ifTrue: [BTPromise new rejectWith: nil]
		ifFalse: [super leaving]