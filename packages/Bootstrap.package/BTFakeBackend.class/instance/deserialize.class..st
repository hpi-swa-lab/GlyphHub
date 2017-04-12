as yet unclassified
deserialize: aDictionaryOrList class: aClass

	^ aDictionaryOrList isBTModelList
		ifTrue: [
			aDictionaryOrList collect: [ :dict |
				self deserializeEntity: dict class: aClass ]]
		ifFalse: [ self deserializeEntity: aDictionaryOrList class: aClass ]