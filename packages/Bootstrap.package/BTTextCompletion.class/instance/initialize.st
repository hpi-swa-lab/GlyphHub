initialize-release
initialize

	super initialize.
	
	activeSuggestionIndex := 0.
	onlyAllowsExactMatches := false.
	displayAllWhenEmpty := false.
	suggestionsList := #().
	suggestionsDropdown := BTDropdown new