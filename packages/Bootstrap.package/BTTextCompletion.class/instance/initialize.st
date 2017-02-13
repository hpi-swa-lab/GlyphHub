as yet unclassified
initialize
	super initialize.
	
	activeSuggestion := 0.

	" default handler to block newlines. feel free to override! "
	self returnDo: [ nil ].
	
	suggestions := BTDropdown new selectedDo: [ :action :label |
		self selected: label firstSubmorph plainText ]