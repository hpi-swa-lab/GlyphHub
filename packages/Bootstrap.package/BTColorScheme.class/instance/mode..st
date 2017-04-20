variations
mode: aMode

	(mode == aMode or: [colorType isNil]) ifTrue: [^ self].
	
	^ BTColorScheme colorType: colorType mode: aMode