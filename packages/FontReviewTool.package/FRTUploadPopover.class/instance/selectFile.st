callbacks
selectFile

	| backend |
	backend := self family backend.

	backend pickFontToUpload ifNotNilDo: [:fontFilestream |
		self topLevel startLoadingOperation.
		((backend upload: fontFilestream toFamily: self family id commitMessage: commitMessageTextArea text)
			then: [
				self delete.
				self topLevel
					stopLoadingOperation;
					openPage: FRTFontOverviewPage new with: self family])
			catch: [:err |
				self add: (BTAlert text: 'Uploading Failed' type: #danger) at: 2.
				self topLevel stopLoadingOperation]]