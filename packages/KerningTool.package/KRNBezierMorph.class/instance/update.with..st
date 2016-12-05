initialize-release
update: aParameter with: aPoint
	super update: aParameter.
	
	aParameter == #pointMoved ifTrue: [
		self submorphAfter ifNotNilDo: [ :prev | prev endPoint position: self startPoint position. prev updateExtent ].
		self submorphBefore ifNotNilDo: [ :next | next startPoint position: self endPoint position. next updateExtent ].
		
		self updateExtent ]