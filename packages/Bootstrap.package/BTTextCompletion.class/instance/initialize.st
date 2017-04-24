initialize-release
initialize

	super initialize.
	
	activeSuggestionIndex := 0.
	onlyAllowsExactMatches := false.

	suggestionsDropdown := BTDropdown new