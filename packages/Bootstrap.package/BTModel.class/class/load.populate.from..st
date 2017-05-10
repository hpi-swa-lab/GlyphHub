load-id
load: anIdNumber populate: aCollection from: aBackend
	
	^ aBackend
		load: anIdNumber
		into: self
		populate: aCollection