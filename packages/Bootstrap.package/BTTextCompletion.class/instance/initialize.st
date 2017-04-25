initialize-release
initialize

	super initialize.
	
	activeSuggestionIndex := 0.
	onlyAllowsExactMatches := false.
	suggestionsList := #().
	suggestionsDropdown := BTDropdown new