as yet unclassified
doesNotUnderstand: aMessage
	fulfilled := fulfilled not.
	
	self arguments
		ifNotNilDo: [ :expected |
		 actual := aMessage arguments first: expected size ]