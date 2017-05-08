loading
loadThread: aThread

	^ (FRTThread load: aThread id populate: self threadFields from: self backend)
		then: [:newThread | 
			self
				thread: newThread;
				updateTitle: newThread;
				loadGlyphPreviewForThread: newThread;
				displayComments;
				changed.
			self loadThreadSubscriptionStatus: newThread].