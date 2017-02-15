as yet unclassified
testTagListForLanguages

	self 
		assert: #('Engineer' 'Language1 Beginner') equalsContent: (user tagListForLanguages: #('Language1'));
		assert: #('Engineer' 'Language1 Beginner' 'Language2 Native') equalsContent: (user tagListForLanguages: #('Language1' 'Language2'))	