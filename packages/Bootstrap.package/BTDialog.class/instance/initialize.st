as yet unclassified
initialize
	super initialize.
	
	titleLabel := BTLabel text: 'Dialog'.
	
	self
		vResizing: #rigid;
		hResizing: #rigid;
		add: (BTCardHeader new
			add: ((BTIconButton icon: #remove) do: [ self delete ]);
			add: titleLabel)