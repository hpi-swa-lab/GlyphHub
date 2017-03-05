as yet unclassified
initialize
	super initialize.

	self
		padding: 20 @ 12;
		align: #(start fill);
		when: #clicked send: #makeActive: to: self