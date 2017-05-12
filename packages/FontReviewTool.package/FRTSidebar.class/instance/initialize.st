initialize-release
initialize

	super initialize.
	
	usernameClickable := BTClickableWithText new
		expand: true;
		style: 'weight' set: 800;
		align: #(fill center).
		
	self
		initializeUserDropdown;
		initializeFeedbackButton.
		
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
		add: ((BTClickableWithText text: (BTIcon icon: #home), ' Dashboard')
			when: #clicked send: #openDashboard to: self);
		add: ((BTClickableWithText text: (BTIcon icon: #file_text), ' Sample Texts')
			when: #clicked send: #openSampleTexts to: self);
		add: ((BTClickableWithText text: (BTIcon icon: #folder_open), ' My Projects')
			when: #clicked send: #openMyProjects to: self);
		add: BTDivider new;
		add: familyArea;
		add: BTWidget spacer;
		add: self feedbackButton