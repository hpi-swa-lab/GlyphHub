operations
openFamily

	^ (self saveSettings
		then: [FRTFamily load: self family id populate: #(fonts) from: self backend])
		then: [:familyWithFonts | self topLevel openPage: FRTFontPage new with: familyWithFonts defaultFont]