as yet unclassified
initialize
	super initialize.
	
	titleLabel := (BTLabel text: 'Dialog') expand: true.
	
	self
		size: 300 @ 200;
		colorType: #secondary;
		add: (BTCardHeader new
			add: ((BTIconButton icon: #remove) do: [ self delete ]);
			add: titleLabel;
			initiateDragOf: self)