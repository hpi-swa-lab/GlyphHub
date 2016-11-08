as yet unclassified
startClosingTag: aTagName
	"This is not an accessor!"
	self
		startTag: '/', aTagName;
		endTag;
		popTag: aTagName