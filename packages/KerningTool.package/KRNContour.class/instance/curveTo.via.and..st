as yet unclassified
curveTo: aPoint via: aSecondPoint and: aThirdPoint
	points
		add: {aSecondPoint. #cubicOffCurve};
		add: {aThirdPoint. #cubicOffCurve};
		add: {aPoint. #onCurve}