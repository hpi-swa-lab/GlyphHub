navigation
openPreviewGlyphDialog

	^ (FRTGlyphPreviewPicker new
		font: self font;
		openFor: self) then: [missingPreviewGlyphsNotice delete]