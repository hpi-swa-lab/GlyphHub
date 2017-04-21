change reporting
addedMorph: aDropdownItem

	super addedMorph: aDropdownItem.
	
	aDropdownItem
		when: #clicked
		send: #triggerSelected:action:item:
		to: self
		withArguments: {nil. aDropdownItem action. aDropdownItem}