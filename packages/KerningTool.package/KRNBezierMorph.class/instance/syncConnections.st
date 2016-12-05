initialize-release
syncConnections
	(self submorphBefore ifNil: [ closed ifTrue: [ self owner lastSubmorph ] ifFalse: [ nil ]]) ifNotNilDo: [ :prev |
		prev  
			endPoint: self startPoint;
			updateExtent ].
	
	self submorphAfter ifNotNilDo: [ :next | next startPoint: self endPoint. next updateExtent ]