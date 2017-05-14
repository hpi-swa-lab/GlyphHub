as yet unclassified
nextCurveDo: aBlock

	^ self curveDo: [:curve | curve nextCurveDo: aBlock]