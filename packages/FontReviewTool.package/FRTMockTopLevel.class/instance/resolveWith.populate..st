data-helper
resolveWith: aModelOrList populate: aCollection

	| return |
	(aModelOrList isBTModel ifTrue: [{aModelOrList}] ifFalse: [aModelOrList]) do: [:model |
		self populate: model with: aCollection].

	return := (aModelOrList isBTModel ifTrue: [aModelOrList] ifFalse: [aModelOrList as: BTModelList])
		backend: self;
		yourself.
	
	^ BTPromise unit: return