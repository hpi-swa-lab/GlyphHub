color-types
secondary: aMode
	| borderColor textColor |
	textColor := Color fromString: '#292b2c'.
	borderColor := Color black alpha: 0.15.
	
	(aMode == #normal or: [aMode == #outline]) ifTrue: [
		^self fg: textColor bg: Color white border: borderColor ].
	
	aMode == #invert ifTrue: [
		^self fg: Color white bg: (Color fromString: '#636c72') border: Color transparent ].
	
	aMode == #darker ifTrue: [
		^self fg: textColor bg: (Color fromString: '#f7f7f9') border: borderColor  ].
	
	^nil