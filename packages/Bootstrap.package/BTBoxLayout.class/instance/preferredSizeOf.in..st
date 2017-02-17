as yet unclassified
preferredSizeOf: aWidget in: aPoint
	| numberOfExpanding requiredSizePrimary requiredSizeSecondary primarySize spacing sizes minSize |
	requiredSizeSecondary := 0.
	numberOfExpanding := 0.
	sizes := OrderedCollection new.
	primarySize := (self flipPoint: aPoint for: aWidget) x.
	spacing := self requiredSpacingIn: aWidget.
	requiredSizePrimary := spacing.
	
	" determine which of our children want to expand and what minimum they will require "
	aWidget submorphsDo: [ :m | | size |
		m ignoreLayout ifFalse: [
			m expand ifTrue: [ numberOfExpanding := numberOfExpanding + 1 ].
			size := sizes add: (m preferredSizeForWidth: aPoint x - spacing).
			minSize := self flipPoint: size first for: aWidget.
			requiredSizePrimary := requiredSizePrimary + size first x.
			requiredSizeSecondary := requiredSizeSecondary max: size first y ]].
	
	minSize := (self flipPoint: requiredSizePrimary @ requiredSizeSecondary for: aWidget).
	^{{minSize. minSize max: aPoint}. numberOfExpanding. sizes}