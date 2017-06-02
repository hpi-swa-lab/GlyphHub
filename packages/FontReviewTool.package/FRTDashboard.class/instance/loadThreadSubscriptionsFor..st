loading
loadThreadSubscriptionsFor: aUser
	
	^ (FRTThreadSubscription
		loadWhere: {#user -> aUser}
		populate: self subscriptionFields
		from: self backend)
		then: [:subscriptions | 
			subscriptionArea removeAllMorphs.
			subscriptions do: [:subscription | 
					FRTThreadPreviewWidget new
						addTo: subscriptionArea withThread: subscription thread]]