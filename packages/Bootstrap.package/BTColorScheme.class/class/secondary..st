color-types
secondary: aMode

	| borderColor textColor |
	textColor := Color fromString: '#292b2c'.
	borderColor := Color black alpha: 0.275.
	
	(aMode == #normal or: [aMode == #outline]) ifTrue: [
		^ self withForeground: textColor background: Color white border: borderColor].
	
	aMode == #invert ifTrue: [
		^ self withForeground: Color white background: (Color fromString: '#636c72') border: Color transparent].
	
	aMode == #darker ifTrue: [
		^ self withForeground: textColor background: (Color fromString: '#f7f7f9') border: borderColor].
	
	^ self error: 'I don''t know ', aMode