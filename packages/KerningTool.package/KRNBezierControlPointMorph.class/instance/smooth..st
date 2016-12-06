accessing
smooth: aBoolean
	smooth := aBoolean.
	
	self color: (smooth ifTrue: [Color red] ifFalse: [Color orange])