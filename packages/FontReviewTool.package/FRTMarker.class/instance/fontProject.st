as yet unclassified
fontProject
	"for prototype purposes this is hardcoded"
	self version = 0 ifTrue: 
		[Transcript show: 'blah'.
		^ KRNUfo3 openBaskerville ]
	ifFalse:
		[Transcript show: 'blub'.
		^ KRNUfo3 openBaskerville1 ]
	"^ KRNUfo3 openBaskerville "