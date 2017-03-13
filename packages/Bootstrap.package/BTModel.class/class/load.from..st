as yet unclassified
load: aNumber from: aBackend
	^(aBackend loadBy: #id value: aNumber from: self modelName class: self) then: [ :models | models first ]