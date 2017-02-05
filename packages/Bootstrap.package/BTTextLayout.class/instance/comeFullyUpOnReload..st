as yet unclassified
comeFullyUpOnReload: smartRefStream
	layout := 0.
	self break.
	font ifNotNil: [ self font: font ].
	height ifNotNil: [ self height: height ].	
	width ifNotNil: [ self width: width ].
	text ifNotNil: [ self text: text ].

	super comeFullyUpOnReload: smartRefStream