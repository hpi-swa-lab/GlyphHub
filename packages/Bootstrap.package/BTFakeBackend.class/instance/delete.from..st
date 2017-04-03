operations
delete: aNumber from: aString

	^ BTPromise unit: ((tables at: aString) removeAllSuchThat: [ :entity | (entity at: 'id') = aNumber ])