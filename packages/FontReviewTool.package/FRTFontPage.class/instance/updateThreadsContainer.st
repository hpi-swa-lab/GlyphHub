callbacks
updateThreadsContainer

	threadsContainer removeAllMorphs.
	
	(threads select: [:thread | self showClosedThreads or: [thread isOpen]])
		ifNotEmptyDo: [:threadsToShow |
			threadsToShow do: [:thread |
				FRTThreadPreviewWidget new addTo: threadsContainer withThread: thread]]
		ifEmpty: [self showNoThreadsNotice]