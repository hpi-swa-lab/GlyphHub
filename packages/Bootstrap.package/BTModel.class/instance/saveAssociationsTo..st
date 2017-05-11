operations
saveAssociationsTo: aBackend

	^ BTPromise all: ((self class fieldNames collect: [:name | | field |
		field := self get: name.
		((field isBTModel or: [field isBTModelList]) and: [field querying not])
				ifTrue: [field saveTo: aBackend]
				ifFalse: [nil]]) select: [:promise | promise notNil])