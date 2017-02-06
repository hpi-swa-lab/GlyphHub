as yet unclassified
drawOn: aCanvas
	aCanvas asBalloonCanvas
		aaLevel: 4;
		fillOval: self bounds
		fillStyle: (hovered
			ifTrue: [Color fromString: '#333333']
			ifFalse: [Color fromString: '#555555'])
		borderWidth: 0
		borderColor: nil