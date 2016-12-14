as yet unclassified
drawOn: aCanvas
	super drawOn: aCanvas.
	
	snappingLines do: [ :line |
		aCanvas
			line: line first
			to: line second
			width: 1
			color: Color lightGray
			dashLength: 10
			secondColor: Color transparent
			secondDashLength: 10
			startingOffset: 0 ]