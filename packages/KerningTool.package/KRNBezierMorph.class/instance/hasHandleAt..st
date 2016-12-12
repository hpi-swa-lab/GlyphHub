event handling
hasHandleAt: aPoint  
	self submorphsDo: [ :point | (point containsPoint: aPoint) ifTrue: [ ^true ]].
	^false