as yet unclassified
restoreAfterLoad
	layout := 0.
	font ifNotNil: [ self font: font ].
	height ifNotNil: [ self height: height ].	
	width ifNotNil: [ self width: width ].
	text ifNotNil: [ self text: text ]