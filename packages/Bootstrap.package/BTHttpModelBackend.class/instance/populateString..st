private
populateString: aCollection

	^ 'embedded=', ((aCollection collect: [:fieldName | (self class camelCaseToUnderscore: fieldName) -> 1]) as: Dictionary) asJsonString