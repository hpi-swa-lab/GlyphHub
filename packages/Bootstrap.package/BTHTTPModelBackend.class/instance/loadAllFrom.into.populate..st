operations
loadAllFrom: aString into: aClass populate: aCollection
	^(self request: '/', aClass modelName method: 'GET' data: nil) then: [ :data |
		BTModelList withAll: ((data at: '_items') collect: [ :item |
			self jsonToModel: item modelClass: aClass ]) ]