loading
loadThreadSubscriptionsFor: aUser
	
	^ (FRTThreadSubscription
		loadWhere: {#user -> aUser}
		populate: self subscriptionFields
		from: self backend)
		then: [:subscriptions | 
			subscriptionArea removeAllMorphs.
			subscriptions do: [:subscription | | newThreadWidget |
					newThreadWidget := FRTThreadPreviewWidget new.
					subscriptionArea add: newThreadWidget.
					" need to add first so that the toplevel is set when thread: is run "
					newThreadWidget thread: subscription thread]]