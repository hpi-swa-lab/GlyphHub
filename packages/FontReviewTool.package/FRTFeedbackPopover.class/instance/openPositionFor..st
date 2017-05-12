as yet unclassified
openPositionFor: aWidget

	self fullBounds.
	"self halt."
	^ aWidget bounds topCenter - ((self extent x / 2) @ self targetOffset)	