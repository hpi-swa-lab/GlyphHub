loading
loadThread: aThread

	^ ((FRTThread load: aThread id populate: self threadFields from: self backend)
		then: [:newThread |
			self
				thread: newThread;
				updateTitle: self thread;
				updateCloseButton: self thread;
				loadGlyphPreviewForThread: self thread;
				loadThreadSubscriptionStatus: self thread])
		then: [
			self
				displayComments;
				updateLastVisited: self thread;
				changed]