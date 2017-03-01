color-types
info: aMode
	^aMode = #state
		ifTrue: [ self colorSchemeStateBaseColor: '#d9edf7' borderDarken: -0.05 foregroundColor: '#31708f' ]
		ifFalse: [ self colorScheme: aMode baseColor: self baseColorInfo ]