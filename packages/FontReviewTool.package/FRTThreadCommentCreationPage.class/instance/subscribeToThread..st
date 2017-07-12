callbacks
subscribeToThread: aThread

	^ (FRTThreadSubscription
		loadWhere: {#user -> self user. #thread -> aThread}
		populate: #(user thread)
		from: self backend)
		then: [:subscriptions | subscriptions
			ifEmpty: [(FRTThreadSubscription new
				user: self user;
				thread:aThread;
				saveTo: self backend)]]