as yet unclassified
comment: aComment
	
	| textContentMorph metaInfoMorph badgeMorph|
	comment := aComment.
	
	badgeMorph := BTPage row.
	(aComment author tagListForLanguages: aComment thread languages) do: [:each |
		badgeMorph add: (BTBadge text: each type: #success)].
	
	metaInfoMorph := BTPage new
		add: badgeMorph
		oppositeTo: (BTLabel secondary: '@', aComment author username, ' - ', (self printDate: aComment dateTime)).
	
	textContentMorph := BTPage new
		add: (BTLabel  text: aComment text);
		add: metaInfoMorph.
	
	self
		add: ((BTImage form: aComment author avatar) scalingMode: #fixed; minSize: 64);
		add: textContentMorph