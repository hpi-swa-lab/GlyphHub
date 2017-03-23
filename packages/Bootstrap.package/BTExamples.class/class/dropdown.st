examples
dropdown
	| button dropdown |
	button := (BTButton label: 'Your Name ', (BTIcon icon: #caret_down)).
	
	dropdown := BTDropdown new
		add: (BTDropdownItem label: 'Settings' action: #settings);
		add: (BTDropdownItem label: 'Profile' action: #profile);
		add: (BTDropdownItem label: 'Logout' action: #logout);
		when: #selected evaluate: [ :event :action :item | button topLevel displayNotification: action asString type: #info ];
		attachTo: button.
	
	^BTTopLevel new size: 500 asPoint; add: button