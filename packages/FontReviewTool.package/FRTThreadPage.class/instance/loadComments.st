loading
loadComments

	commentArea removeAllMorphs.
	(self commentThread comments sortedBy: #id) do: [:comment |
		commentArea add: (FRTCommentWidget new comment: comment)].