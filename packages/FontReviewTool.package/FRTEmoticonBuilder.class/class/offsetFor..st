helper
offsetFor: anEmoticonString

	^ self emoticons detect: [:emoticon | anEmoticonString = emoticon second]
		ifFound: [:emoticon | emoticon third negated]
		ifNone: [nil]