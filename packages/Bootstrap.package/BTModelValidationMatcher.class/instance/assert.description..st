assertions
assert: aBoolean description: aString

	aBoolean ifFalse: [BTModelValidationFailure new
			model: self model;
			field: self field;
			message: aString;
			signal]