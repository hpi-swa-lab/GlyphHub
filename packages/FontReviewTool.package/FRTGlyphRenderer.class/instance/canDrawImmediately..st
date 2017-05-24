drawing
canDrawImmediately: aGlyphNameStringOrCollection
	" return whether we can immediately draw the given string with our currently cached data "

	self font ifNil: [^ false].

	^ self glyphLoader canDrawImmediately: aGlyphNameStringOrCollection font: self font atVersion: self font latestVersionHash