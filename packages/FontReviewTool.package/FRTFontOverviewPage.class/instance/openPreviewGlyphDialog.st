accessing
openPreviewGlyphDialog

	^ (FRTGlyphPreviewPicker new
		font: self font;
		openCentered) then: [missingPreviewGlyphsNotice delete]