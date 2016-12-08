segments
maximumExtent
	^(self points collect: [ :p | p first x ]) max @ (self points collect: [ :p | p first y ]) max