examples
typeaheadAsync

	^ BTTopLevel new
		add: ((BTTextCompletion placeholder: 'enter ...')
			suggestionsAsynchronusBlock: [:text | | p |
				p := BTPromise new.
				[(Delay forSeconds: 1) wait. p resolveWith: {'asd'. 'asdasdasd'}] fork.
				p])