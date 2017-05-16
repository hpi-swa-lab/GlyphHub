as yet unclassified
build

	| author |
	author := self versionEntry font author.

	self
		add: (BTPage row
			spacing: BTWidget spacing;
			add: ((BTImage fromPromise: author downloadAvatarForm)
				minSize: 64;
				scalingMode: #fixed);
			add: (BTPage column
				add: (BTLabel bold: author username);
				add: (BTLabel text: self versionEntry dateAndTime asString, ' ', (self versionEntry versionHash first: 8))));
		add: (BTLabel text: self versionEntry message);
		add: BTDivider new