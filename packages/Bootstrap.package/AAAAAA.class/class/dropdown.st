as yet unclassified
dropdown
	| button dropdown |
	button := (BTButton label: 'Your Name ', (BTIcon icon: #caret_down)).
	
	dropdown := BTDropdown new
		add: (BTDropdownItem label: 'Settings' action: #settings);
		add: (BTDropdownItem label: 'Profile' action: #profile);
		add: (BTDropdownItem label: 'Logout' action: #logout);
		selectedDo: [ :action | Transcript show: 'Selected '; show: action; cr ];
		attachTo: button.
	
	^BTPage topLevel size: 500 asPoint; add: button