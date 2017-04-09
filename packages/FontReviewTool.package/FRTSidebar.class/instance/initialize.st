initialize-release
initialize

	super initialize.
	
	usernameClickable := BTClickableWithText new
		expand: true;
		styleAttributes: {'font-weight' -> '800'};
		align: #(fill center).
		
	self initializeUserDropdown.
		
	userAvatarImage := BTImage new
		minSize: 36 asPoint;
		scalingMode: #fixed.
	
	self colorScheme: (BTColorScheme fg: Color white bg: (Color fromString: '#333333') border: Color white).
	
	self
		withLayout;
		minSize: self sidebarWidth @ 0;
		vertical: true;
		padding: BTWidget spacing;
		spacing: BTWidget spacing;
		add: (BTPage row
			add: usernameClickable;
			add: userAvatarImage);
		add: BTDivider new;
		add: ((BTClickableWithText text: (BTIcon icon: #home), ' Dashboard')
			when: #clickedNoEvent send: #openDashboard to: self);
		add: (BTClickableWithText text: (BTIcon icon: #file_text), ' Sample Texts');
		add: ((BTClickableWithText text: (BTIcon icon: #folder_open), ' My Projects')
			when: #clickedNoEvent send: #openMyProjects to: self);
		add: BTDivider new