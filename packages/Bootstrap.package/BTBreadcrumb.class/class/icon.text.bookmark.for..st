as yet unclassified
icon: anIconSymbol text: aString bookmark: aBTBookmark for: aBTToplevel

	^ ((self
		label: aString
		icon: anIconSymbol)
			bookmark: aBTBookmark;
			when: #clicked
			send: #openNewPage:with:
			to: aBTToplevel
			withArguments: aBTBookmark)