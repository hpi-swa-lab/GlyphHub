as yet unclassified
comment: aComment
	comment := aComment.
	image image: aComment image.
	meta text: '@', aComment author, ' - ', (self printDate: aComment dateTime).
	text contents: aComment text