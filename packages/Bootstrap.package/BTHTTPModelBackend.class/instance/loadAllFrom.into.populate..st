operations
loadAllFrom: aTableNameString into: aClass populate: aCollection
	^(self request: '/', (self camelCaseToUnderscore: aTableNameString) method: 'GET' data: nil) then: [ :data |
		BTModelList withAll: ((data at: '_items') collect: [ :item |
			self jsonToModel: item modelClass: aClass ]) ]