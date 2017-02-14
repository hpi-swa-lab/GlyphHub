as yet unclassified
initialize
	super initialize.
	
	titleLabel := BTLabel text: 'Dialog'.
	
	self
		vResizing: #rigid;
		hResizing: #rigid;
		size: 300 @ 200;
		add: (BTCardHeader new
			add: ((BTIconButton icon: #remove) do: [ self delete ]);
			add: titleLabel)