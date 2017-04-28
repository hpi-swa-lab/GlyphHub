initialize-release
initialize

	super initialize.
	
	self
		add: (BTWidget new
			minSize: 80 @ 0;
			layoutPolicy: (FRTFixedGridLayout cellSize: 16);
			spacing: BTWidget spacing / 3;
			addAll: (self defaultColors collect: [:colorString | | buttonColor |
				buttonColor := Color fromString: colorString.
				BTClickable new
					when: #clicked send: #triggerSelectedColor: to: self with: buttonColor;
					color: buttonColor]))