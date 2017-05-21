callback
chooseFile

	| stream |
	stream := self backend pickFontToUpload.
	
	loadingIndicator visible: true.
	
	((self backend upload: stream toFamily: self family id commitMessage: 'First Version')
		then: [self startPolling])
		catch: [:err |
			alertArea add: (BTAlert text: 'Uploading file failed!' type: #danger).
			loadingIndicator visible: false]