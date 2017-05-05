displaying
openCentered

	acceptPromise := BTPromise new.

	self
		fullBounds;
		center: self currentWorld center;
		openInWorld.
	
	^ acceptPromise