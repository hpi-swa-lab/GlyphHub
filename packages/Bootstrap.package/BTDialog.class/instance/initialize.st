as yet unclassified
initialize
	super initialize.
	
	titleLabel := (BTLabel text: 'Dialog') expand: true.
	
	self
		size: 300 @ 200;
		colorType: #secondary;
		add: (BTCardHeader new
			add: ((BTIconButton icon: #remove) when: #clicked send: #delete to: self);
			add: titleLabel;
			initiateDragOf: self)