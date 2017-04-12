operations
loadAllInto: aClass populate: aCollection

	^ (self
		request: '/', (self class camelCaseToUnderscore: aClass modelName), '?', (self populateString: aCollection)
		method: 'GET'
		data: nil) then: [:data |
			BTModelList withAll: ((data at: '_items') collect: [:item |
				self jsonToModel: item modelClass: aClass ])]