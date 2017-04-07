loading
loadTags

	tagArea removeAllMorphs.
	self thread tags do: [ :each | tagArea add: (BTBadge text: each) ].