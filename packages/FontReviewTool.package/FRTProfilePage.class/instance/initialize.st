as yet unclassified
initialize

	| userAvatarImage headingArea |
	super initialize.
	
	userAvatarImage := (BTImage new
		minSize: 66 asPoint;
		scalingMode: #fixed;
		path: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin.png').
		
	headingArea := (BTPage row
		add: userAvatarImage;
		add: (BTLabel heading: 'username');
		yourself).
	
	self
		add: headingArea;
		add: (BTLabel text: 'password')