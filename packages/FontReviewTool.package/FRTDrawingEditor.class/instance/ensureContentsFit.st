actions
ensureContentsFit

	drawingContainer submorphsDo: [:morph | | delta |
		delta := morph extent - drawingArea extent.
		(delta x > 0 or: [delta y > 0]) ifTrue: [
			drawingContainer minSize: morph extent / BTWidget scalingFactor]]