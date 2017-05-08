callbacks
enteringWithThread: aThread andGlyph: aGlyph

	self loadAttachments.

	^ (self promiseForThread: aThread)
		then: [:newThread |
			self
				thread: newThread;
				enteredFromGlyph: aGlyph;
				updateTitle: newThread;
				updateGlyphLinks: newThread;
				loadGlyphPreviewForThread: newThread]