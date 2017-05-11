operations
loadAllInto: aClass populate: aCollection
	" we are assuming that populate will have been set intelligently by the user populating the mock
	  database. alternatively we could make sure that a non-populated field is always only an ID "
	
	^ self resolveWith: (entities select: [:entity | entity class = aClass]) populate: aCollection