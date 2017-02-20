as yet unclassified
preferredSizeOfChildren: aWidget in: aPoint
	| numberOfExpanding primarySize spacing sizes minSize minSizePrimary minSizeSecondary natSize natSizePrimary natSizeSecondary |
	numberOfExpanding := 0.
	sizes := OrderedCollection new.
	primarySize := (self flipPoint: aPoint for: aWidget) x.
	spacing := self requiredSpacingIn: aWidget.
	minSizePrimary := natSizePrimary := spacing.
	minSizeSecondary := natSizeSecondary := 0.
	
	" determine which of our children want to expand and what minimum they will require "
	aWidget submorphsDo: [ :m | | size |
		m ignoreLayout ifFalse: [
			m expand ifTrue: [ numberOfExpanding := numberOfExpanding + 1 ].
			size := sizes add: (m preferredSizeForWidth: aPoint x - spacing).
			Transcript show: {'For determining min, from'. aWidget class name. 'to'. aPoint x. 'and got'. size}; cr.
			minSize := self flipPoint: size first for: aWidget.
			natSize := self flipPoint: size second for: aWidget.
			minSizePrimary := minSizePrimary + minSize x.
			minSizeSecondary := minSizeSecondary max: minSize y.
			natSizePrimary := natSizePrimary + natSize x.
			natSizeSecondary := natSizeSecondary max: natSize y ]].
	
	minSize := self flipPoint: minSizePrimary @ minSizeSecondary for: aWidget.
	natSize := self flipPoint: natSizePrimary @ natSizeSecondary for: aWidget.
	^{{minSize. natSize}. numberOfExpanding. sizes}