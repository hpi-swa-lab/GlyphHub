lifecycle
propagateFont

	self topLevel selectedFont: self font.			
	self renderer
		backend: self backend;
		font: self font.

	overviewTab font: self font.
	fontNameLabel text: self font fontName.
	fontAuthorLabel text: 'by ', self font author username.