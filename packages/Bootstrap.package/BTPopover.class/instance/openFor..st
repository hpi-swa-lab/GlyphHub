as yet unclassified
openFor: aTargetWidget
	self
		position: aTargetWidget bounds bottomCenter - ((self extent x / 2) @ BTWidget arrowTipSize negated);
		openInWorld