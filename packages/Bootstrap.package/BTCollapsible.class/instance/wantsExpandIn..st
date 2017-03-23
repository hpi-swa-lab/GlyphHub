layout
wantsExpandIn: isVertical  
	| anyExpand |
	anyExpand := {false. false}.
	self expand ifTrue: [anyExpand at: (isVertical ifTrue: [2] ifFalse: [1]) put: true].
	^anyExpand