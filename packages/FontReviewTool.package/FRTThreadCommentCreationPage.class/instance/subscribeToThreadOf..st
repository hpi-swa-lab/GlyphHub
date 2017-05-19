callbacks
subscribeToThreadOf: aComment

	^ (FRTThreadSubscription
		loadWhere: {#user -> self user. #thread -> aComment thread}
		populate: #(user thread)
		from: self backend)
		then: [:subscriptions | subscriptions
			ifEmpty: [(FRTThreadSubscription new
				user: self user;
				thread: aComment thread;
				saveTo: self backend)]]