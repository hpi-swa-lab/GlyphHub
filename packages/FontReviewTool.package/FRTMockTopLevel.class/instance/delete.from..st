operations
delete: aNumber from: aTableNameString

	^ entities
		at: aNumber
		ifPresent: [:entity |
			aTableNameString = entity class modelName
				ifTrue: [
					entities removeKey: aNumber.
					BTPromise unit: nil]
				ifFalse: [self rejectBecauseNotFound]]
		ifAbsent: [self rejectBecauseNotFound]