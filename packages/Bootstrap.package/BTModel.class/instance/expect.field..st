validations
expect: anObject field: aSymbol

	^ BTModelValidationMatcher new subject: anObject; model: self; field: aSymbol; yourself