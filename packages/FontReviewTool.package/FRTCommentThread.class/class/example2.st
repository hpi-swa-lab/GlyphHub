as yet unclassified
example2
	^FRTCommentThread new
		isOpen: true;
		title: 'More contrast';
		ancestor: nil;
		marker: FRTMarker example1;
		addComment: FRTComment example2;
		addComment: FRTComment example1;
		addTag: 'OpenType';
		addLanguage: 'French'