event handling
removedMorph: aMorph
	self submorphsDo: [ :segment |
		segment syncAllConnections.
		segment nextSegment ifNotNilDo: [ :next | segment markEndSmooth: next startPointMorph smooth ]]