as yet unclassified
initialize
	super initialize.
	
	activeSuggestion := 0.
	
	self when: #confirmed send: #selected: to: self.
	
	suggestions := BTDropdown new when: #selected send: #selectedEvent:action:item: to: self