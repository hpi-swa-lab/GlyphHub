loading
loadComments

	(self thread comments sortedBy: #id) do: [:comment |
		commentArea add: (FRTCommentWidget new comment: comment)].