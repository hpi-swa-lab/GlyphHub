as yet unclassified
saveTo: aBackend
	self isDirty ifFalse: [ ^Promise unit: self ].
	self isValid ifFalse: [ ^Promise new rejectWith: self ].
	
	^(aBackend save: self to: self class modelName) then: [ :model |
		model
			markAllDirty: false;
			saveAssociationsTo: aBackend ] ifRejected: [ :error | error signal ]