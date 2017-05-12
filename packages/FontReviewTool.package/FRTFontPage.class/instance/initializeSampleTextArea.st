initialize-release
initializeSampleTextArea
	
	| sampleSentence sampleWord |
	sampleWord := BTTextEntry placeholder: 'Enter a sample word here'.
	sampleSentence := BTTextEntry placeholder: ''.
	
	^ BTPage column
		add: sampleWord.