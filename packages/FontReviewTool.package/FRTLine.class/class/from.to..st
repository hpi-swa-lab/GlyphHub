as yet unclassified
from: aPoint to: anotherPoint

	^ self new
		startPoint: aPoint;
		controlPoint1: aPoint;
		controlPoint2: anotherPoint;
		endPoint: anotherPoint;
		yourself