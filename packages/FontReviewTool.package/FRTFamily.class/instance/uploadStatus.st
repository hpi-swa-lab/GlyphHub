accessing
uploadStatus

	" the values we get from the server may be the numbers corresponding to their enum values "
	^ uploadStatus isNumber
		ifTrue: [uploadStatus = 1 ifTrue: ['ready_for_upload'] ifFalse: ['processing']]
		ifFalse: [uploadStatus]