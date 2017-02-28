as yet unclassified
extent: aPoint
	layoutWidth := aPoint x.
	self layout width: aPoint x.
	super extent: aPoint
	"| desired width layoutInset |
	layoutInset := self layoutInset class = Rectangle
		ifTrue: [ (self layoutInset left + self layoutInset right) @ (self layoutInset top + self layoutInset bottom) ]
		ifFalse: [ self layoutInset asPoint * 2 ].
	
	width := fillMode = #fixed ifTrue: [-1] ifFalse: [aPoint x - layoutInset x].
	self layout width: width.
	desired := self layout extent.
	width := fillMode = #fill ifTrue: [aPoint x] ifFalse: [desired x + layoutInset x].
	
	super extent: width @ (desired y + layoutInset y)"