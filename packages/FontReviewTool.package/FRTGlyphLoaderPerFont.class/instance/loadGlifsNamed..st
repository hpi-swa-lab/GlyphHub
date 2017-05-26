as yet unclassified
loadGlifsNamed: aGlyphNameStringCollection

	| awaiting state missingGlyphNames |
	state := (aGlyphNameStringCollection
		gather: [:glyphName | self allKnownRequiredGlyphNamesFor: glyphName])
		asSet
		groupBy: [:glyphName | glifs at: glyphName ifPresent: [:x | #loading] ifAbsent: [#missing]].
	
	awaiting := (state at: #loading ifAbsent: [#()]) collect: [:glyphName | glifs at: glyphName].
	missingGlyphNames := state at: #missing ifAbsent: [#()].
	
	(missingGlyphNames notEmpty or: [fontinfo isNil]) ifTrue: [
			awaiting := awaiting copyWith: (self loadQueryFor: missingGlyphNames)].
	
	^ (BTPromise all: awaiting) then: [
		" check if we learned that some glifs require components that we now need to load "
		(self canDrawImmediately: aGlyphNameStringCollection)
			ifFalse: [self loadGlifsNamed: aGlyphNameStringCollection]
			ifTrue: [aGlyphNameStringCollection collect: [:glyphName | glifs at: glyphName]]]