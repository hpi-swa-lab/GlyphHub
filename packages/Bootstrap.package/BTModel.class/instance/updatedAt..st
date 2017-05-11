operations
updatedAt: aDateTimeOrString

	self update: #updatedAt with: (aDateTimeOrString ifNotNilDo: #asDateAndTime)