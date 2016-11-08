accessing
cursorMoveToGlyphClosestTo: aPoint
	"This function works with global coordinates"
	| pointAsRectangle closestSubmorph distance minDistance |
	pointAsRectangle := (Rectangle center: (aPoint) extent: 0).
	minDistance := self targetView extent dist: self targetView position.
	self targetView submorphs do: [:morph |
		(morph intersects: pointAsRectangle) ifTrue: [
			closestSubmorph := morph.
			minDistance := -1]
		ifFalse:[
			distance := morph center dist: pointAsRectangle center.
			(distance < minDistance )ifTrue:[
					minDistance := distance.
					closestSubmorph := morph]]].
	(pointAsRectangle center x >= closestSubmorph center x) ifTrue: [
		self cursorMoveInFrontOf: closestSubmorph.]
	ifFalse: [
		self cursorMoveBehind: closestSubmorph.]