loading
displayComments

	(self thread comments sortedBy: #createdAt) do: [:comment | | commentWidget |
		commentWidget := FRTCommentWidget new.
		commentArea add: commentWidget.
		commentWidget
			comment: comment;
			lastVisited: self subscription lastVisited]