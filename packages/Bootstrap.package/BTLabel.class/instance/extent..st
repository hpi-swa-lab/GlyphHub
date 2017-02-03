as yet unclassified
extent: aPoint
	| height |
	layout ~= 0
		ifTrue: [
			height := self primLayout: layout heightForWidth: aPoint x.
			super extent: aPoint x @ height ]
		ifFalse: [ super extent: aPoint ]