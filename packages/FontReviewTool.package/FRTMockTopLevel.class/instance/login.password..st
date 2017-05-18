mock-data
login: anEmailString password: aPasswordString

	^ (anEmailString = self user email and: [aPasswordString = self user password])
		ifTrue: [BTPromise unit: self user id]
		ifFalse: [BTPromise new rejectWith: (BTHttpError new statusCode: 401)]