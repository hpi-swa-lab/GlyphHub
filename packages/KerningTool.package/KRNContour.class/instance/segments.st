segments
segments
	| addBlock list |
	list := OrderedCollection new.
	addBlock := [].
	
	self segmentsDoLine: [ :p | list add: {#line. p} ] cubic: [ :p | list add: {#cubic. p} ] conic: [ :p | list add: {#conic. p} ].
	
	^list