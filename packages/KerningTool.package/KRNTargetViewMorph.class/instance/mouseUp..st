as yet unclassified
mouseUp: evt
	"This function works with global coordinates"
	| eventPosition closestSubmorph distance minDistance |
	eventPosition := Rectangle center: (evt cursorPoint "- self position") extent: 0.
	minDistance := self extent dist: self position.
	self submorphs do: [:morph |
		(morph intersects: eventPosition) ifTrue: [
			closestSubmorph := morph.
			minDistance := -1]
		ifFalse:[
			distance := morph center dist: eventPosition center.
			(distance < minDistance )ifTrue:[
					minDistance := distance.
					closestSubmorph := morph]]].
	(eventPosition center x >= closestSubmorph center x) ifTrue: [
		self owner cursorMoveInFrontOf: closestSubmorph.]
	ifFalse: [
		self owner cursorMoveBehind: closestSubmorph.]