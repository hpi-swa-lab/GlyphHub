as yet unclassified
saveAssociationsTo: aBackend
	| field |
	self class instVarNames do: [ :name |
		field := self instVarNamed: name.
		field isBTModel ifTrue: [
			self flag: #todo. " gather all the returned promises and return only when all are done "
			field saveTo: aBackend ]]