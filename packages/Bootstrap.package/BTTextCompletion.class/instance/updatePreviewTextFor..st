text
updatePreviewTextFor: aString
	" if we selected a suggestion, display that one. otherwise try completing one "

	super updateText: 
		(self activeSuggestionDo: #plainText ifNone: [
			self
				completableSuggestionFor: aString
				do: [:item | aString, '<span color="#ccc">', (item plainText allButFirst: aString size), '</span>']
				ifNone: [aString]]).

	self changed