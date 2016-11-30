as yet unclassified
initialize
	super initialize.
	self color: Color lightGray.

	inspectView := KRNGlyphInspectMorph new
		autoScale: true;
		baseline: true;
		xHeight: true;
		capHeight: true;
		yourself.

	bitmapView := KRNBitmapGlyphPickerMorph new
		onFormPickedDo: [ :form | self addGlyph: form ].

	self
		extent: 640 @ 800;
		addMorph: inspectView fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.5) offsets: (0 @ 0 corner: 0 @ 0));
		addMorph: bitmapView fullFrame: (LayoutFrame fractions: (0 @ 0.5 corner: 1 @ 1) offsets: (0 @ 0 corner: 0 @ 0));
		layoutPolicy: ProportionalLayout new