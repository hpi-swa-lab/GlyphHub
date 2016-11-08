initialize-release
layoutChanged
	| targetPtSize |
	super layoutChanged.
	
	(self font isNil or: [self autoScale not]) ifTrue: [ ^self ].
	
	targetPtSize := self calculatePtSize.
	targetPtSize ~= self ptSize ifTrue: [ self ptSize: targetPtSize ]