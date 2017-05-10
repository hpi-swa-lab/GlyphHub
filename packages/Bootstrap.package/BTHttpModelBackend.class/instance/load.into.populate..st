operations
load: aNumber into: aClass populate: aCollection

	^ (self request: (self class camelCaseToUnderscore: aClass modelName), '/', aNumber, '?', (self populateString: aCollection) method: 'GET' data: nil)
		then: [:item | self jsonToModel: item modelClass: aClass]