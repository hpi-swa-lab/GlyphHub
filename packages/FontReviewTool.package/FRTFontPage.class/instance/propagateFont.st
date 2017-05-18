lifecycle
propagateFont

	self topLevel selectedFont: self font.			
	self renderer
		backend: self backend;
		font: self font.
	
	versionWidgets
		removeAllMorphs;
		addAll: (self font family versionMessages collect: [:version |
			FRTVersionHistoryEntryWidget new versionEntry: version]).

	overviewTab font: self font.
	fontNameLabel text: self font fontName.
	fontAuthorLabel text: 'by ', self font author username