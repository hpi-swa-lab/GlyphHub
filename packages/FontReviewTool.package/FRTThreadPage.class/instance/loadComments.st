loading
loadComments
	commentArea removeAllMorphs.
	self commentThread comments do: [:comment |
		commentArea add: (FRTCommentWidget new comment: comment)].