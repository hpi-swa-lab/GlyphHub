operations
loadAllFrom: aString into: aClass populate: aCollection
	^(self request: '/', aClass modelName method: 'GET' data: nil) then: [ :data |
		BTModelList withAll: ((data at: '_items') collect: [ :item | | instance |
			instance := aClass new.
			aClass instVarNames do: [:name |
				instance instVarNamed: name put: (item at: name asString)].
			instance privateId: (item at: '_id').
			instance]) ]