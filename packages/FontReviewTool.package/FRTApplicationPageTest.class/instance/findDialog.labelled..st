helper
findDialog: aDialogSubclass labelled: aString

	^ World submorphs detect: [:morph |
		morph class = aDialogSubclass and: [morph title = aString]] ifNone: [self error: 'No dialog opened']