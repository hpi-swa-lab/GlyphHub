as yet unclassified
placeChildren: aCollection of: aWidget space: aNumber
	| containerSize leftOverSpace extraExpanderSpace offset |
	containerSize := (aNumber max: totalMin) max: (self flipPoint: aWidget minSize) x.
	
	" apply special hfw rules :o "
	(hasHeightForWidth and: [vertical]) ifTrue: [
		aCollection do: [ :child |
			child hasHeightForWidth ifTrue: [
				child finalSize: (child heightForWidth: aNumber) first ]]].
	
	leftOverSpace := self distributeLeftOver: aNumber - totalMin for: aWidget among: aCollection.
	extraExpanderSpace := (expanderCount < 1 ifTrue: [0] ifFalse: [leftOverSpace / expanderCount]) floor.
	
	offset := 0.
	aCollection do: [ :child | 
		child
			finalSize: child finalSize + (child expanding ifTrue: [extraExpanderSpace] ifFalse: [0]);
			offset: offset.
		
		offset := offset + child finalSize + aWidget spacing ].
	
	^aCollection