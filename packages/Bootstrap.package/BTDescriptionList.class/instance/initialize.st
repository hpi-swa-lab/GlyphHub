as yet unclassified
initialize
	super initialize.
	items := OrderedCollection new.
	maxMinWidth := 0.
	self
		withLayout;
		vertical: true