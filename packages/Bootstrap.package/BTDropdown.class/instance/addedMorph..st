as yet unclassified
addedMorph: aDropdownItem
	super addedMorph: aDropdownItem.
	
	aDropdownItem do: [ self selectedDo value: aDropdownItem action. self delete ]