accessing
advance
	| advance height width |
	advance := glif firstTagNamed: #advance.
	width := 0.
	height := 0.
	width := advance attributeAt: #width ifAbsent: [
		height := advance attributeAt: #height ifAbsent: [
			self error: 'Invalid advance provided' ]].
	
	height isZero ifTrue: [ height := width ].
	
	^width asNumber @ height asNumber