as yet unclassified
triggerSelected: anEvent action: aValue item: aDropdownItem
	self triggerEvent: #selected withArguments: {anEvent. aValue. aDropdownItem}.
	self delete