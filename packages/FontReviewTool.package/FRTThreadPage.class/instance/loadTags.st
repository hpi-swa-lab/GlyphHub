loading
loadTags

	tagArea removeAllMorphs.
	self commentThread tags do: [ :each | tagArea add: (BTBadge text: each) ].