loading
loadThread: aThread

	^ (FRTThread load: aThread id populate: self threadFields from: self backend)
		then: [:newThread |
			self
				thread: newThread;
				updateTitle: newThread;
				updateCloseButton: newThread;
				loadGlyphPreviewForThread: newThread;
				displayComments;
				loadThreadSubscriptionStatus: newThread;
				changed].