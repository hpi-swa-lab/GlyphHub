as yet unclassified
minSizeForWidth: aNumber
	| layoutInset width desired |
	layoutInset := self layoutInset class = Rectangle
		ifTrue: [ (self layoutInset left + self layoutInset right) @ (self layoutInset top + self layoutInset bottom) ]
		ifFalse: [ self layoutInset asPoint * 2 ].
	
	width := fillMode = #fixed ifTrue: [-1] ifFalse: [aNumber - layoutInset x].
	self layout width: width.
	desired := self layout extent.
	width := fillMode = #fill ifTrue: [aNumber] ifFalse: [desired x + layoutInset x].
	
	^width @ desired y + layoutInset y