operations
saveAssociationsTo: aBackend
	^BTPromise all: ((self class instVarNames collect: [ :name | | field |
		field := self instVarNamed: name.
		((field isBTModel or: [field isBTModelList]) and: [field querying not])
				ifTrue: [ field saveTo: aBackend ]
				ifFalse: [ nil ]]) select: [ :promise | promise notNil ])