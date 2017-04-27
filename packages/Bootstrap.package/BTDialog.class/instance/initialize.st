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
			add: ((BTIconButton icon: #remove) when: #clickedWithEvent send: #delete to: self);
			add: titleLabel;
			initiateDragOf: self)