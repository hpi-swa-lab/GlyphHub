as yet unclassified
initialize 
	super initialize.
	self color: Color white.
	self extent: 500 asPoint.
	self outline: (KRNOutline new
			extent: self extent;
			lockLayoutChanged: true;
			editor: self;
			addContour: (KRNContour new
  				extent: 600 @ 600; 
  				addSegment: KRNBezierMorph new)).
	selectedContour := KRNNullContour new.
	self addMorph: outline  