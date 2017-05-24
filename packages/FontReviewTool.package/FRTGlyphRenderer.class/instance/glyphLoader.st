accessing
glyphLoader

	" yes I know this is very indirect, but at least not global (giving font the glyphLoader would be misleading, since its a glyphLoader of all fonts and generally an attribute that is accessible from any model) "
	^ self font backend glyphLoader