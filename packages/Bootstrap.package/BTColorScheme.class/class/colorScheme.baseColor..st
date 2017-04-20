private
colorScheme: aMode baseColor: aBaseColor

	(aMode == #normal or: [aMode == #invert]) ifTrue: [^ self fg: Color white bg: aBaseColor border: aBaseColor].
	aMode == #outline ifTrue: [^ self fg: aBaseColor bg: Color white border: aBaseColor].
	^ nil