loading
loadThreadSubscriptionsFor: aUser
	
	^ (FRTThreadSubscription
		loadWhere: {#user -> aUser}
		populate: #(thread 'thread.title' 'thread.comments' 'thread.comments.author')
		from: self backend)
		then: [:subscriptions | 
			subscriptionArea removeAllMorphs.
			subscriptions do: [:subscription | | newThreadWidget |
					newThreadWidget := FRTThreadPreviewWidget new.
					subscriptionArea add: newThreadWidget.
					newThreadWidget thread: subscription thread]]