operations
deleteFrom: aBackend  

	^ (aBackend delete: self id from: self class modelName) then: [
		self
			markAllDirty: true;
			privateId: 0.
		self class defaultFieldNames do: [:field | self set: field to: nil].
		self]