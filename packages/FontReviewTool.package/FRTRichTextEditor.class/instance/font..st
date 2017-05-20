accessing
font: aFont

	(aFont downloadOtf)
		then: [richText font: aFont.
			self updateToolbar]