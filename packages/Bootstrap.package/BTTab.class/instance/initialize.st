as yet unclassified
initialize
	super initialize.

	self
		padding: 20 @ 12;
		align: #(start end);
		do: [ self parent makeActive: self ]