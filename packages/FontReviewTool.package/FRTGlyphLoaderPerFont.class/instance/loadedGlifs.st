as yet unclassified
loadedGlifs

	^ (glifs select: [:promise | promise isResolved]) collect: [:promise | promise value]