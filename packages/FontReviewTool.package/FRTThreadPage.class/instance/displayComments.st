loading
displayComments

	(self thread comments sortedBy: #createdAt) do: [:comment | 
		FRTCommentWidget new
			addTo: commentArea withComment: comment;
			lastVisited: self subscription lastVisited]