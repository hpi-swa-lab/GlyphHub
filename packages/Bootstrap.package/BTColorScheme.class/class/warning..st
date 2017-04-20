color-types
warning: aMode

	^ aMode == #state
		ifTrue: [ self colorSchemeStateBaseColor: '#fcf8e3' borderDarken: -0.05 foregroundColor: '#8a6d3b' ]
		ifFalse: [ self colorScheme: aMode baseColor: self baseColorWarning ]