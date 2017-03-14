load-by
loadBy: aField value: anObject from: aBackend populate: aCollection
	^aBackend loadBy: aField value: anObject from: self modelName class: self populate: aCollection