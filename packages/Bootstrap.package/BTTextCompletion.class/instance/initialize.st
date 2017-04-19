initialize-release
initialize

	super initialize.
	
	activeSuggestion := 0.
	onlyCompletions := false.
	
	suggestions := BTDropdown new when: #selected send: #selectedEvent:action:item: to: self