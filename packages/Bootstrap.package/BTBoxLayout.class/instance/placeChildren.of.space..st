as yet unclassified
placeChildren: aCollection of: aWidget space: aNumber
	| containerSize leftOverSpace extraExpanderSpace offset |
	containerSize := (aNumber max: totalMin) max: (self flipPoint: aWidget minSize) x.
	
	(hasHeightForWidth and: [vertical]) ifTrue: [
		aCollection do: [ :child |
			child widget hasHeightForWidth ifTrue: [ | size |
				size := (child widget heightForWidth: aNumber) first.
				child minSize: size; naturalSize: size; finalSize: size ]]].
	
	leftOverSpace := self distributeLeftOver: aNumber - totalMin for: aWidget among: aCollection.
	extraExpanderSpace := (expanderCount < 1 ifTrue: [0] ifFalse: [leftOverSpace / expanderCount]) floor.
	
	offset := 0.
	aCollection do: [ :child | 
		child
			finalSize: child finalSize + (child expanding ifTrue: [extraExpanderSpace] ifFalse: [0]);
			offset: offset.
		
		offset := offset + child finalSize + aWidget spacing ].
	
	^aCollection