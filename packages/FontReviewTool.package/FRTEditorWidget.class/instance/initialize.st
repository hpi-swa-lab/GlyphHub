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
		ignoreLayout: true;
		withPadding.
	
	{FRTCommentThread example1. FRTCommentThread example2. FRTCommentThread example3} do: [ :thread | | link |
		link := (BTLink text: thread title) when: #clickedNoEvent evaluate: [ thread asWidget openInWorld ].
		link label ellipsize: #end.
		overlay add: link ].
	
	overlay
		add: BTWidget spacer;
		add: (BTButton label: 'Publish a Snap' icon: #share) small.
	
	self
		add: overlay;
		add: image;
		extent: image extent;
		padding: 0