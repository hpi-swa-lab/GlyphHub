as yet unclassified
updateExtent
	"self hasSubmorphs ifTrue: [ | oldBounds delta |
		oldBounds := self bounds.
		self bounds: (Rectangle merging: (self submorphs collect: [ :morph | morph bounds ])).
		
		delta := self bounds origin - oldBounds origin ]"