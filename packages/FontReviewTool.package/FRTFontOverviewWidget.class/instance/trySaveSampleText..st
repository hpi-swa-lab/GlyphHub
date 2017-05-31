callbacks
trySaveSampleText: aRichText

	^ aRichText
		ifEmpty: [
			self topLevel displayNotification: 'Sample text cannot be empty' type: #danger.
			BTPromise new rejectWith: (BTValidationFailure new message: 'Sample text cannot be empty')]
		ifNotEmpty: [self saveSampleText: aRichText]