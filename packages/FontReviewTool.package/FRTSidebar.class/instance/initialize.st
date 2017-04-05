initialize-release
initialize

	super initialize.
	
	usernameLabel := BTLabel new
		expand: true;
		styleAttributes: {'font-weight' -> '800'};  
		align: #(fill center).
	
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
			add: usernameLabel;
			add: userAvatarImage);
		add: BTDivider new;
		add: (BTClickableWithText text: (BTIcon icon: #home), ' Dashboard');
		add: (BTClickableWithText text: (BTIcon icon: #file_text), ' Sample Texts');
		add: (BTClickableWithText text: (BTIcon icon: #folder_open), ' My Projects');
		add: BTDivider new