initialize-release
releaseAssociationsIfUncreatedEntityDo: aBlock
	" set associations to their id values instead of the actual objects and empty collections "
	
	self class associations keysAndValuesDo: [:associationName :association | | value |
		value := self perform: associationName.
		
		value isBTModel ifTrue: [
			value isCreated ifFalse: [aBlock value: value].
			self instVarNamed: associationName put: value id].
		value isBTModelList ifTrue: [self instVarNamed: associationName put: BTModelList new]]