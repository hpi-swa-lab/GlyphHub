as yet unclassified
initialize 
	| editingArea buttonPanel |
	super initialize.
	self
		color: Color white;
		extent: 500 asPoint;
		outline: (KRNOutline new
			extent: self extent;
			lockLayoutChanged: true;
			editor: self;
			addContour: (KRNContour new
  				extent: 600 @ 600; 
  				addSegment: KRNBezierMorph new)).
	selectedContour := KRNNullContour new.
	editingArea := Morph new
		color: Color white;
		yourself.
	buttonPanel := self createButtonPanel.
	editingArea addMorph: outline.
	self
		addMorph: editingArea  fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.9) offsets: (0 @ 0 corner: 0 @ 0 )); 
		addMorph: buttonPanel fullFrame: (LayoutFrame fractions: (0 @ 0.9 corner: 1 @ 1) offsets: (0 @ 0 corner: 0 @ 0));
		layoutPolicy: ProportionalLayout new;
		yourself 