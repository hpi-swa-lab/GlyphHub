as yet unclassified
balloonPointsForContour: aCollection
	 | allPoints |
	allPoints := Array
		new: aCollection points size * 2 
		streamContents: [:stream |
			(self balloonPointsForContour: aCollection on: stream)].
	^ (allPoints collect: [ :p | (p x / 64.0) @ (p y / -64.0) ]) floor asPointArray