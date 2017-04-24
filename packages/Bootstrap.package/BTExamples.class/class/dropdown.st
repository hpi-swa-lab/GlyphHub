examples
dropdown

	| button dropdown topLevel |
	button := (BTButton label: 'Your Name ', (BTIcon icon: #caret_down)).
	topLevel := BTTopLevel new size: 500 asPoint.
	
	dropdown := BTDropdown new
		add: ((BTDropdownItem label: 'Settings')
			when: #clicked send: #displayNotification:type: to: topLevel withArguments: {'Settings'. #info});
		add: ((BTDropdownItem label: 'Profile')
			when: #clicked send: #displayNotification:type: to: topLevel withArguments: {'Profile'. #info});
		add: ((BTDropdownItem label: 'Logout')
			when: #clicked send: #displayNotification:type: to: topLevel withArguments: {'Settings'. #info});
		attachTo: button.

	^ topLevel add: button