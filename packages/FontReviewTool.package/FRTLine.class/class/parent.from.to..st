as yet unclassified
parent: aTransformable from: aPoint to: anotherPoint

	^ (self forParent: aTransformable)
		startPoint: aPoint;
		controlPoint1: aPoint;
		controlPoint2: anotherPoint;
		endPoint: anotherPoint;
		yourself