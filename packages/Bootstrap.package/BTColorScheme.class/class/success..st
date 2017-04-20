color-types
success: aMode

	^ aMode == #state
		ifTrue: [ self colorSchemeStateBaseColor: '#dff0d8' borderDarken: -0.07 foregroundColor: '#3c763d' ]
		ifFalse: [ self colorScheme: aMode baseColor: self baseColorSuccess ]