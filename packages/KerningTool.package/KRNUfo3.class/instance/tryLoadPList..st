as yet unclassified
tryLoadPList: aName
	^(self path fileExists: aName)
		ifTrue: [ (KRNPListConverter deserialize: (self path / aName) fullName) content ]
		ifFalse: [ OrderedDictionary new ]