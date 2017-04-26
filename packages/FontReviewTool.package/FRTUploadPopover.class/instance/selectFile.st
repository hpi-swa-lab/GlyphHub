callbacks
selectFile

	| backend |
	backend := self family backend.

	backend pickFontToUpload ifNotNilDo: [:stream |
		self topLevel startLoadingOperation.
		((backend upload: stream toFamily: self family id commitMessage: changeText text)
			then: [
				self delete.
				self topLevel
					stopLoadingOperation;
					openPage: FRTFontOverviewPage new with: self family])
			catch: [:err |
				self add: (BTAlert text: 'Uploading Failed' type: #danger) at: 2.
				self topLevel stopLoadingOperation]]