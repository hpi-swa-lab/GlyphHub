callbacks
updateThreadsContainer

	| threadsToShow |
	threadsContainer removeAllMorphs.

	threadsToShow := threads.
	self showClosedThreads 
		ifFalse: [threadsToShow := threadsToShow reject: [:thread | thread closed]].		
	threadsToShow notEmpty
		ifTrue: [
			threadsToShow do: [:thread | | newThreadWidget |
				newThreadWidget := FRTThreadPreviewWidget new.
				threadsContainer add: newThreadWidget.
				newThreadWidget thread: thread]]
		ifFalse: [threadsContainer
			add: ((BTIcon newFor: #comments) pointSize: 32; alignment: #center);
			add: ((BTLabel secondarySubHeading: 'Discussions about this font will appear here.') alignment: #center)]