as yet unclassified
initialize
	super initialize.
	self image: self class exampleBitmap copy.

	formPicked := [ :form | ].

	{18@26 extent: 131@104. 156@55 extent: 83@76. 248@60 extent: 71@82 } do: [ :rect |
		self addMorph: (KRNBitmapGlyphPickerRegionMorph new
			extent: rect extent;
			position: rect origin;
			yourself) ]