callback
chooseFile

	| stream |
	stream := self backend pickFontToUpload ifNil: [^ self].
	
	fileSelectButton disabled: true.
	uploadedFileLabel text: 'Uploading ', (stream name asString subStrings: '/') last, ' ...'.
	self loadingIndicator visible: true.
	
	^ ((self backend upload: stream toFamily: self family id commitMessage: 'First Version')
		then: [self startPolling])
		catch: [:err |
			alertArea add: (BTAlert text: 'Uploading file failed!' type: #danger).
			loadingIndicator visible: false]