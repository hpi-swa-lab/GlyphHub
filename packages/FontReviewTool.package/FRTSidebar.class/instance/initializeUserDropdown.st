initialize-release
initializeUserDropdown

	| dropdown |
	dropdown := BTDropdown new
		add: (BTDropdownItem label: 'Profile' action: #openProfilePageOfCurrentUser);
		add: (BTDropdownItem label: 'Logout' action: #logoutCurrentUser);
		when: #selected evaluate: [ :event :action :item | self perform: action];
		attachTo: usernameClickable