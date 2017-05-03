as yet unclassified
pointsFromNode: aNode

	| elements firstType |
	elements:= aNode elements.
	firstType := self typeFromNode: elements first.

	cycleWhenSaving := 0.
	
	" list is circular and starts offcurve, copy last element (must be oncurve) to the front "
	firstType = #offcurve
		ifTrue: [
			elements addFirst: elements last.
			cycleWhenSaving := 0]
		ifFalse: [
			firstType = #curve ifTrue: [cycleWhenSaving := 1].
			" we have a closed (circular) shape, so first and last points match "
			firstType = #move
				ifFalse: [elements add: elements first]].

	^ elements