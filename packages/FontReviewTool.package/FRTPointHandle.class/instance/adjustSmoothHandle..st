as yet unclassified
adjustSmoothHandle: anOppositeHandle

	anOppositeHandle smooth ifTrue: [ | anchorPosition |
			anchorPosition := self anchor coordinates.
			
			anOppositeHandle coordinates: anchorPosition + (Point
				r: (anchorPosition dist: anOppositeHandle coordinates)
				degrees: (anchorPosition - self coordinates) theta radiansToDegrees)]