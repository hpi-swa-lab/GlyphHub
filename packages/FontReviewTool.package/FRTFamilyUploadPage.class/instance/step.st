callback
step

	" avoid launching a new request while our old is still waiting "
	(pollPromise isNil or: [pollPromise isPending not]) ifTrue: [
		pollPromise := self family loadStatus then: [:status |
			(status at: 'upload_status') ~= 'FamilyUploadStatus.processing' ifTrue: [
				loadingIndicator visible: false.
				
				(status at: 'error')
					ifNotNilDo: [:error | alertArea add: (BTAlert text: 'Converting your font failed! ', error type: #danger)]
					ifNil: [alertArea add: (BTAlert text: 'Font upload and converted successfully!' type: #success)]]]]