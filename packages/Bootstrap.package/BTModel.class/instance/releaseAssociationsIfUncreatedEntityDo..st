initialize-release
releaseAssociationsIfUncreatedEntityDo: aBlock
	" set associations to their id values instead of the actual objects and empty collections "
	
	self class associations keysAndValuesDo: [:associationName :association | | value |
		value := self get: associationName.
		
		value isBTModel ifTrue: [
			value isCreated ifFalse: [aBlock value: value].
			self instVarNamed: associationName put: value id].
		value isBTModelList ifTrue: [
			self set: associationName to: (BTModelList forField: associationName owner: self)]]