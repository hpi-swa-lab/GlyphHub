load-by
hasManyAssociationNamed: aStringOrSymbol

	^ self associations
		at: aStringOrSymbol asSymbol
		ifPresent: [:association | association isMany]
		ifAbsent: [false]