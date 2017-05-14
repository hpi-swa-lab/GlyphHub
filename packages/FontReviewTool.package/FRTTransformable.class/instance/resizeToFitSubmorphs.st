as yet unclassified
resizeToFitSubmorphs
	" resizes and returns the delta the morph was moved during the resize "

	| delta oldBounds |
	(lockLayoutChanged or: [self hasSubmorphs not]) ifTrue: [^ 0 asPoint].
	
	lockLayoutChanged := true.
	oldBounds := self bounds.
	self bounds: (Rectangle merging: (self submorphs collect: #bounds)).
	delta := oldBounds origin - self bounds origin.
	self submorphsDo: [:morph | morph position: morph position + delta].
	lockLayoutChanged := false.
	^ delta