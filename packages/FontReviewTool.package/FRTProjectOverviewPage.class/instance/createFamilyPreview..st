updating
createFamilyPreview: aFamily

	^ BTClickable new
		withLayout;
		when: #clickedNoEvent send: #openFamily: to: self with: aFamily;
		add: ((BTLabel text: '<span size="40000">Aa </span>') align: #(start center));
		add: ((BTLabel text:
			'<span size="larger" weight="bold">', aFamily familyName, '</span>    ',
			'<span size="smaller">', aFamily fonts size, ' ', ('Font' asPluralBasedOn: aFamily fonts),
			', by ', aFamily authorsString, '</span>') align: #(start center))