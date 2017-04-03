operations
deleteFrom: aBackend  

	^ (aBackend delete: self id from: self class modelName) then: [ :Promise |
		self
			markAllDirty: true;
			privateId: 0 ]