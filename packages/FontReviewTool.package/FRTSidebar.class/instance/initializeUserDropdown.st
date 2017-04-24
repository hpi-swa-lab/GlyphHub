initialize-release
initializeUserDropdown

	| dropdown |
	dropdown := BTDropdown new
		add: ((BTDropdownItem label: 'Profile')
			when: #clicked send: #openProfilePageOfCurrentUser to: self);
		add: ((BTDropdownItem label: 'Logout')
			when: #clicked send: #logoutCurrentUser to: self);
		attachTo: usernameClickable