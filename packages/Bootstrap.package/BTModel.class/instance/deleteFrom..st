as yet unclassified
deleteFrom: aBackend  
	^(aBackend delete: self id from: self class modelName) whenResolved: [ :P |
		self
			markAllDirty: true;
			privateId: 0 ]