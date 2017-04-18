text
minRows: aNumber

	| oldText |
	[oldText := self layout text.
	self layout text: (String new: aNumber withAll: Character cr).
	self minSize:
		self minSize x @
		(self layout extent y / BTWidget scalingFactor) floor]
		ensure: [self layout text: oldText]