loading
loadThreads
	
	^ (FRTFont
		load: self font id
		populate: self fontFields
		from: self backend)
		then: [:newFont |
			threads := newFont allUniqueThreads.
			self updateThreadsContainer]