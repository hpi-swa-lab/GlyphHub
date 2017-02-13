as yet unclassified
initialize
	| image overlay |
	super initialize.
	
	image := BTImage new
		scalingMode: #full;
		path: FileDirectory default / 'BP2016H1' / 'editor_false_glyph.png'.
	
	overlay := BTPage new
		color: (Color fromString: '#ebebeb');
		extent: 139 @ 304;
		position: 910 @ 468;
		disableTableLayout: true;
		withPadding;
		yourself.
	
	{FRTCommentThread example1. FRTCommentThread example2. FRTCommentThread example3} do: [ :thread |
		overlay add: ((BTLabel small: (BTLabel linkMarkup: thread title)) fillMode: #fill) ].
	
	overlay
		add: BTWidget verticalSpacer;
		add: (BTButton label: 'Publish a Snap' icon: #share) small.
	
	self
		add: overlay;
		add: image;
		extent: image extent;
		padding: 0