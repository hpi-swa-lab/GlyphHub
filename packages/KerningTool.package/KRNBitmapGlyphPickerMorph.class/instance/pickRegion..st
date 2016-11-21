as yet unclassified
pickRegion: aRegion
	| rect |
	rect := aRegion position - self position extent: aRegion extent.	

	self removeMorph: aRegion.

	formPicked value: (self image contentsOfArea: rect).

	self image fill: rect fillColor: Color transparent.
	self changed