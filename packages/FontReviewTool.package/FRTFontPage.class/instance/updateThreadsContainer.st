callbacks
updateThreadsContainer

	threadsContainer removeAllMorphs.
	
	threads notEmpty
		ifTrue: [ | threadsToShow |
			threadsToShow := threads.
			self showClosedThreads ifFalse:
				[threadsToShow := threadsToShow reject: [:thread | thread closed]].		
			threadsToShow do: [:thread |
				threadsContainer add: (FRTThreadPreviewWidget new thread: thread)]]
		ifFalse: [threadsContainer
			add: ((BTIcon newFor: #comments) pointSize: 32; alignment: #center);
			add: ((BTLabel secondarySubHeading: 'Discussions about this font will appear here.') alignment: #center)]