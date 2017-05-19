initialize-release
initialize

	super initialize.
	
	usernameClickable := BTClickableWithText new
		expand: true;
		style: 'weight' set: 800;
		align: #(fill center).
		
	self
		initializeUserDropdown;
		initializeFeedbackButton;
		initializeNavigationLinks.
		
	userAvatarImage := BTImage new
		minSize: 36 asPoint;
		scalingMode: #fixed.
		
	familyArea := BTPage column.
	self updateFamilyArea.
	
	self colorScheme: (BTColorScheme
		withForeground: Color white
		background: (Color fromString: '#333333')
		border: Color white).
	
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
		add: navigationLinks;
		add: BTDivider new;
		add: familyArea;
		add: BTWidget spacer;
		add: self feedbackButton