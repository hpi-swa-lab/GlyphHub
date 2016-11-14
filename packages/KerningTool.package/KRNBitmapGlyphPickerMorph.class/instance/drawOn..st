as yet unclassified
drawOn: aCanvas
	aCanvas clipBy: self bounds during: [ :canvas |
		canvas fillColor: Color white ].
	
	super drawOn: aCanvas