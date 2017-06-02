callback
pollStatus
	
	" avoid launching a new request while our old is still waiting "
	^ (pollPromise isNil or: [pollPromise isPending not])
		ifTrue: [
			pollPromise := self family loadStatus then: [:status |
				(status at: 'status') = 'ready_for_upload' ifTrue: [
					self loadingIndicator visible: false.
					self stopSteppingSelector: #pollStatus.
					
					(status at: 'error')
						ifNotNilDo: [:error | self displayUploadError: error]
						ifNil: [self displayUploadSuccess]].
				true]]
		ifFalse: [BTPromise unit: true]