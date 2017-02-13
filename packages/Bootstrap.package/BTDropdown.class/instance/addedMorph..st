as yet unclassified
addedMorph: aDropdownItem
	super addedMorph: aDropdownItem.
	
	aDropdownItem do: [
		self selectedDo valueWithEnoughArguments: {aDropdownItem action. aDropdownItem}.
		self delete ]