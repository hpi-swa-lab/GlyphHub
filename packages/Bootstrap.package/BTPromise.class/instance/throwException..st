private
throwException: anException

	^ anException isApplicationError not or: [self class throwAllErrors]