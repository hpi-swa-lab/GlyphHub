initialize-release
initialize
	super initialize.

	self
		padding: 20 @ 12;
		align: #(start fill);
		when: #clickedWithEvent send: #makeActive: to: self