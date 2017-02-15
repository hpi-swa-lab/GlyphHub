as yet unclassified
comment: aComment
	
	| textContentMorph metaInfoMorph badgeMorph|
	comment := aComment.
	
	badgeMorph := BTPage row.
	(aComment author tagListForLanguages: aComment thread languages) do: [:each |
		badgeMorph add: (BTBadge text: each type: #success)].
	
	metaInfoMorph := BTPage row.
	metaInfoMorph add: badgeMorph oppositeTo: (BTLabel  secondary: '@', aComment author username, ' - ', (self printDate: aComment dateTime)).
	
	textContentMorph := BTPage sizing: #(spaceFill shrinkWrap) vertical: true.
	textContentMorph
		add: (BTLabel  text: aComment text);
		add: metaInfoMorph.
	
	self
		add: ((BTImage form: aComment author avatar) scalingMode: #rigid; extent: 64 asPoint);
		add:  textContentMorph