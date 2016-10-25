as yet unclassified
findKerningBetween: firstGlyph and: secondGlyph
	" resolve kerning, precendence:
		glyph -> glyph
		glyph -> group
		group -> glyph
		group -> group "
	(firstGlyph isCursor or: [secondGlyph isCursor]) ifTrue: [ ^0 ].
	
	^(kerning at: firstGlyph name ifAbsent: [
		groups keysAndValuesDo: [ :groupName :group |
			(group includes: firstGlyph name) ifTrue: [
				(kerning at: groupName ifAbsent: [^0]) at: secondGlyph name ifAbsent: [
					"TODO glyph->group" ]]].
		^0
	]) at: secondGlyph name ifAbsent: [0]