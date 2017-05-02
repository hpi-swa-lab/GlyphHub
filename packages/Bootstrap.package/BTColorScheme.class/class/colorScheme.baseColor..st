private
colorScheme: aMode baseColor: aBaseColor

	(aMode == #normal or: [aMode == #invert]) ifTrue: [^ self withForeground: Color white background: aBaseColor border: aBaseColor].
	aMode == #outline ifTrue: [^ self withForeground: aBaseColor background: Color white border: aBaseColor].
	^ nil