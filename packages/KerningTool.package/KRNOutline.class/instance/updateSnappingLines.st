as yet unclassified
updateSnappingLines
	| lines |
	lines := OrderedCollection new.
	
	self editor movingPoint ifNotNilDo: [ :moving |
		(self allPointsButLinkedOf: moving) do: [ :point |
			{{point center x - self position x @ 0. 0 @ self height}. {0 @ (point center y - self position y). self width @ 0}} do: [ :line | | from to |
			
			from := self position + line first.
			to := self position + line first + line second.
			
			(moving unsnappedPosition onLineFrom: from to: to within: self snappingDistance) ifTrue: [
				lines add: {from. to. line second x = 0 ifTrue: [#y] ifFalse: [#x]} ]]]].

	(snappingLines hasEqualElements: lines) ifFalse: [ self changed ].    

	^snappingLines := lines