as yet unclassified
colorScheme
	^self changeColorOnHover ifTrue: [ super colorScheme hovered: (self hovered or: [self active]) ] ifFalse: [ super colorScheme ]