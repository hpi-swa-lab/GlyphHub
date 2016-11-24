as yet unclassified
qcurveTo: aPoint via: aListOfPoints
	points
		addAll: (aListOfPoints collect: [ :point | {point. #conicOffCurve}]);
		add: {aPoint. #onCurve}