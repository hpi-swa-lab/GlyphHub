as yet unclassified
parent: aTransformable from: aStartPoint via: aControlPoint and: anotherControlPoint to: anEndPoint

	^ (self forParent: aTransformable)
		startPoint: aStartPoint;
		controlPoint1: aControlPoint;
		controlPoint2: anotherControlPoint;
		endPoint: anEndPoint;
		yourself