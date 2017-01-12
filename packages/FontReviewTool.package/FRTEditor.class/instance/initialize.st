as yet unclassified
initialize
	| editor notifications |
	super initialize.
	
	editor := ImageMorph new
		image: (Form fromFileNamed: (FileDirectory default / 'BP2016H1' / 'editor_false_glyph.png') fullName);
		yourself.
	
	notifications := UiContainer new
		changeTableLayout;
		yourself.
	
	self
		color: (Color gray: 0.1);
		extent: editor extent;
		changeProportionalLayout;
		addMorph: editor;
		addMorph: notifications fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 1) offsets: (editor extent x - FRTNotification width - self class notificationsInset x @ self class notificationsInset y corner: FRTNotification width @ 400)).
	
	{FRTCommentThread example1. FRTCommentThread example2. FRTCommentThread example3} do: [ :example |
		notifications addMorph: (FRTNotification for: example) ]