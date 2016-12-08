as yet unclassified
updateExtent
	lockLayoutChanged ifTrue: [ ^self ].
	
	self hasSubmorphs ifTrue: [ | oldBounds delta |
		lockLayoutChanged := true.
		oldBounds := self bounds.
		self bounds: (Rectangle merging: (self submorphs collect: [ :morph | morph bounds ])).
		delta := oldBounds origin - self bounds origin.
		self submorphsDo: [ :s | s position: s position + delta ].
		lockLayoutChanged := false ]