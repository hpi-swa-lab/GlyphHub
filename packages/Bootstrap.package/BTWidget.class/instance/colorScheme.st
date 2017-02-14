colors
colorScheme
	colorScheme == #inherit ifFalse: [ ^colorScheme ].
	^(self parent
		ifNotNilDo: #colorScheme
		ifNil: [ BTColorScheme default ]) mode: self colorMode