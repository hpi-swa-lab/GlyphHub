operations
createdAt: aDateTimeOrString

	self update: #createdAt with: (aDateTimeOrString ifNotNilDo: #asDateAndTime)