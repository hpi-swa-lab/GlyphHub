segments
syncPoints
	^self hasSubmorphs
		ifTrue: [ self submorphs gather: [ :segment | segment points ]]
		ifFalse: [ points ]