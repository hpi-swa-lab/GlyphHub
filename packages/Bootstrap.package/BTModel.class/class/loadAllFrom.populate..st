load-all
loadAllFrom: aBackend populate: aCollection
	^aBackend loadAllFrom: self modelName class: self populate: aCollection