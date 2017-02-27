as yet unclassified
applyAlignmentWithOffset: offsetPoint in: nonLayoutSize
	| destBox wanted available |
	available := finalSize @ nonLayoutSize.
	wanted := widget preferredSize second.
	
	vertical ifTrue: [available := available transposed].    
	vertical
		ifTrue: [
			wanted := (wanted x min: nonLayoutSize) @ (wanted y min: finalSize) ]
		ifFalse: [
			wanted := (wanted x min: finalSize) @ (wanted y min: nonLayoutSize).
			widget hasHeightForWidth ifTrue: [
				wanted := wanted x @ (widget heightForWidth: wanted x) ]].
	
	destBox := offsetPoint + (vertical ifTrue: [0 @ offset] ifFalse: [offset @ 0]) extent: wanted.
	
	widget align first == #center ifTrue: [ destBox := destBox translateBy: ((available x / 2) - (wanted x / 2) @ 0) floor ].
	widget align second == #center ifTrue: [ destBox := destBox translateBy: 0 @ ((available y / 2) - (wanted y / 2)) floor ].
	
	widget align first == #fill ifTrue: [ destBox := destBox withWidth: available x ].
	widget align second == #fill ifTrue: [ destBox := destBox withHeight: available y ].
	
	widget align first == #end ifTrue: [ destBox := destBox translateBy: available x - destBox width @ 0 ].
	widget align second == #end ifTrue: [ destBox := destBox translateBy: 0 @ (available y - destBox height) ].
	
	widget bounds: destBox