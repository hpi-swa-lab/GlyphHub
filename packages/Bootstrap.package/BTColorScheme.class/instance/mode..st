variations
mode: aMode
	(mode == aMode or: [colorType isNil]) ifTrue: [ ^self ].
	
	^BTColorScheme type: colorType mode: aMode