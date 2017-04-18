updating
createFamilyPreview: aFamily

	| preview |
	preview := aFamily fonts
		ifNotEmpty: [
			FRTGlyphWidget new
				font: aFamily fonts anyOne;
				withPreviewLetters;
				pointSize: 64]
		ifEmpty: [BTWidget new].
		
	preview minSize: 100 @ 60.

	^ BTClickable new
		withLayout;
		when: #clickedNoEvent send: #openFamily: to: self with: aFamily;
		add: preview;
		add: ((BTLabel text:
			'<span size="larger" weight="bold">', aFamily familyName, '</span>    ',
			'<span size="smaller">', aFamily fonts size, ' ', ('Font' asPluralBasedOn: aFamily fonts),
			', by ', aFamily authorsString, '</span>') align: #(start center))