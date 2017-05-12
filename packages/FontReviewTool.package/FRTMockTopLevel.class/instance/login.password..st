mock-data
login: aUserNameString password: aPasswordString

	^ (aUserNameString = self user username and: [aPasswordString = self user password])
		ifTrue: [BTPromise unit: self user id]
		ifFalse: [BTPromise new rejectWith: (BTHttpError new statusCode: 401)]