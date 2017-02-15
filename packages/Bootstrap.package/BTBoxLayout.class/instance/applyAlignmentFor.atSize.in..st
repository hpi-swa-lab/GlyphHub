as yet unclassified
applyAlignmentFor: aWidget atSize: aPoint in: aBox
	| destBox |
	" this corresponds to first and second set to #start "
	destBox := aBox origin extent: aPoint.
	
	aWidget align first == #center ifTrue: [ destBox := destBox translateBy: ((aBox width / 2) - (aPoint x / 2) @ 0) floor ].
	aWidget align second == #center ifTrue: [ destBox := destBox translateBy: 0 @ ((aBox height / 2) - (aPoint y / 2)) floor ].
	
	aWidget align first == #expand ifTrue: [ destBox := destBox withWidth: aBox width ].
	aWidget align second == #expand ifTrue: [ destBox := destBox withHeight: aBox height ].
	
	aWidget align first == #end ifTrue: [ destBox := destBox translateBy: aBox width - aPoint x @ 0 ].
	aWidget align second == #end ifTrue: [ destBox := destBox translateBy: 0 @ (aBox height - aPoint y) ].
	
	aWidget bounds: destBox