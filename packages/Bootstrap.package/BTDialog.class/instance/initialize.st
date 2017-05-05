initialize-release
initialize
	super initialize.
	
	titleLabel := (BTLabel text: 'Dialog')
		expand: true;
		subHeading.
	
	self
		size: 300 @ 200;
		colorType: #secondary;
		add: (BTCardHeader new
			add: ((BTIconButton icon: #remove) when: #clicked send: #cancel: to: self with: nil);
			add: titleLabel;
			initiateDragOf: self)