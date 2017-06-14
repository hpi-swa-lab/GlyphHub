as yet unclassified
saveOutlines
	
	| font loaderPerFont |
	font := self font.
	loaderPerFont := font backend glyphLoader loaderFor: font atVersion: font latestVersionHash.
	loaderPerFont glifs at: self glyphName put: (BTPromise unit: outlines xmlElement).
	self accept: outlines