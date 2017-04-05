accessing
authorsString
	" comma-separated string displaying the authors of all included fonts "

	self fonts ifNil: [self error: 'Fonts collection not populated, can''t create authors string'].
	
	^ (self fonts collect: [:font | font author username]) asArray joinSeparatedBy: ', '