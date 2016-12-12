as yet unclassified
initialize
	super initialize.
	
	self
		layoutPolicy: TableLayout new;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap.
	
	#(('Auto' #auto) ('Aligned' #aligned) ('Free' #free)) do: [ :type |
		self addMorph: (SimpleButtonMorph new
			actionSelector: #handleType:;
			target: self;
			arguments: {type second};
			label: type first;
			hResizing: #spaceFill;
			yourself) ]