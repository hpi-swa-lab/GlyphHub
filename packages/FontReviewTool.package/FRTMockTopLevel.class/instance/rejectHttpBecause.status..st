data-helper
rejectHttpBecause: aMessageString status: aNumber

	^ BTPromise new rejectWith: (BTHttpError new
		statusCode: aNumber;
		messageText: aMessageString;
		yourself)