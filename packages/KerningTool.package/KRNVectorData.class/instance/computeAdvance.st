accessing
computeAdvance
	| glifAdvance height width |
	glifAdvance := glif firstTagNamed: #advance.
	width := 0.
	height := 0.
	width := glifAdvance attributeAt: #width ifAbsent: [
		height := glifAdvance attributeAt: #height ifAbsent: [
			self error: 'Invalid advance provided' ]].
	
	height isZero ifTrue: [ height := width ].
	
	advance := (width asNumber @ height asNumber)