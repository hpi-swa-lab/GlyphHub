as yet unclassified
deleteFrom: aBackend  
	^(aBackend delete: self id from: self class modelName) then: [ :P |
		self
			markAllDirty: true;
			privateId: 0 ]