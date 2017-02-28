color-types
danger: aMode
	^aMode == #state
		ifTrue: [ self colorSchemeStateBaseColor: '#f2dede' borderDarken: -0.05 foregroundColor: '#a94442' ]
		ifFalse: [ self colorScheme: aMode baseColor: self baseColorDanger ]  