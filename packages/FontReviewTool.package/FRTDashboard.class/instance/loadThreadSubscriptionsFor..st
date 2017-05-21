loading
loadThreadSubscriptionsFor: aUser
	
	^ (FRTThreadSubscription
		loadWhere: {#user -> aUser}
		populate: #(thread 'thread.title' 'thread.comments' 'thread.comments.author')
		from: self backend)
		then: [:subscriptions | 
			subscriptionArea removeAllMorphs.
			subscriptions do: [:subscription |
					subscriptionArea add: (FRTThreadPreviewWidget new thread: subscription thread)]]