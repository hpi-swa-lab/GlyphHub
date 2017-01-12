as yet unclassified
commentThread: aCommentThread
	| titleText |
	commentThread := aCommentThread.
	
	isOpen checked: commentThread isOpen.
	
	titleText := (aCommentThread title, ' ')
		asText
		allBold
		addAttribute: (TextFontReference toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' pointSize: 20)).
	
	title text: (titleText append: (Text string: '(On version 0.0.1)' attribute: TextColor gray)).
	
	comments removeAllMorphs.
	aCommentThread comments reverseDo: [ :comment |
		comments addMorphFront: comment asMorph ].
	
	self allMorphsDo: [ :s | s layoutChanged ]