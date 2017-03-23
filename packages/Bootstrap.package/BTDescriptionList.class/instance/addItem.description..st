items
addItem: aKey description: aString
	| keyLabel newWidth row |
	items add: {aKey. aString}.
	keyLabel := BTLabel bold: aKey.
	newWidth := (keyLabel sizeForWidth: -1) x.
	newWidth > maxMinWidth ifTrue: [
		maxMinWidth := newWidth.
		self submorphsDo: [:each | each submorphs first minSize: maxMinWidth@0]].
	row := BTPage row.
	row
		add: (keyLabel minSize: maxMinWidth@0);
		add: (BTLabel text: aString).
	self add: row.