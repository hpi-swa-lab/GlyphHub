logout
logout

	self apiToken: nil.
	^ BTPromise unit: nil