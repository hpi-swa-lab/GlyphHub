callbacks
trySaveSampleText: aRichText

	^ aRichText
		ifEmpty: [
			self topLevel displayNotification: 'Sample cannot be empty' type: #danger.
			BTPromise new rejectWith: 'Empty sample text']
		ifNotEmpty: [self saveSampleText: aRichText]