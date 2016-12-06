segments
updateExtent
	self hasSubmorphs ifTrue: [  
		self bounds: (Rectangle merging: (self submorphs collect: [ :morph | morph bounds ])) ]