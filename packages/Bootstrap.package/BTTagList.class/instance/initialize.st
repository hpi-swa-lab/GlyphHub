as yet unclassified
initialize
	super initialize.
	
	tags := OrderedCollection new.
	
	self
		withLayout;
		padding: (BTWidget spacing / 2) floor