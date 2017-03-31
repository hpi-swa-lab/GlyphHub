enumerating
collect: aBlock
	" Set insists on creating a new set. we want a BTModelList though. FIXME: better put this upstream "
	| newSet |
	newSet := self species new: self size.
	self do: [ :each | newSet add: (aBlock value: each) ].
	^newSet