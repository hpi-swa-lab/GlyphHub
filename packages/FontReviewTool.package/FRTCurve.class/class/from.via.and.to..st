as yet unclassified
from: aStartPoint via: aControlPoint and: anotherControlPoint to: anEndPoint

	^ self new
		startPoint: aStartPoint;
		controlPoint1: aControlPoint;
		controlPoint2: anotherControlPoint;
		endPoint: anEndPoint;
		yourself