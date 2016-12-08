as yet unclassified
updateExtent
	self lockLayoutChanged ifTrue: [ ^self ].
	
	self hasSubmorphs ifTrue: [ | oldBounds delta |
		self lockLayoutChanged: true.
		oldBounds := self bounds.
		self bounds: (Rectangle merging: (self submorphs collect: [ :morph | morph bounds ])).
		delta := oldBounds origin - self bounds origin.
		self submorphsDo: [ :s | s position: s position + delta ].
		self lockLayoutChanged: false ]