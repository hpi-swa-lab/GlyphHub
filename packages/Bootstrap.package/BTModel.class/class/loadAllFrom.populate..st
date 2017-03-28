load-all
loadAllFrom: aBackend populate: aCollection
	^aBackend loadAllFrom: self modelName into: self populate: aCollection