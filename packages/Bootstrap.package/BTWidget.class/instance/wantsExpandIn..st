layout
wantsExpandIn: isVertical
	" fix: layout should be asked if it has any children that expand "
	| anyExpand |
	anyExpand := {false. false}.
	self expand ifTrue: [anyExpand at: (isVertical ifTrue: [2] ifFalse: [1]) put: true].
	
	self submorphs do: [ :child | | expandTuple |
		expandTuple := child wantsExpandIn: self vertical.
		expandTuple first ifTrue: [anyExpand at: 1 put: true].
		expandTuple second ifTrue: [anyExpand at: 2 put: true]].
	
	^anyExpand