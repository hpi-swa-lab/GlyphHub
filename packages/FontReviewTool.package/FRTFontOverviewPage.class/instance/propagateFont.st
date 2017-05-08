lifecycle
propagateFont

	self topLevel selectedFont: self font.			
	self renderer font: self font.

	fontNameLabel text: self font fontName.
	fontAuthorLabel text: 'by ', self font author username.