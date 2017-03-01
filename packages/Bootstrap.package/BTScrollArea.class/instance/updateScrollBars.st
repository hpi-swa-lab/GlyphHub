as yet unclassified
updateScrollBars
	| isVertical width offset size |
	container hasSubmorphs ifFalse: [
		scrollBars do: [ :bar | bar visible: false ].
		^self ].
	
	isVertical := false.
	width := BTWidget borderRadius * 2.
	size := self extent * self percentVisible.
	offset := self extent * (self scrollOffset  / container firstSubmorph extent).
	
	scrollBars do: [ :scrollbar |
		scrollbar visible: (isVertical ifTrue: [size y < self height] ifFalse: [size x < self width]).
		
		scrollbar bounds: ((isVertical
			ifTrue: [self width - width @ offset y extent: width @ size y]
			ifFalse: [offset x @ self height - width extent: size x @ width]) translateBy: self layoutBounds origin).
		
		isVertical := true ]