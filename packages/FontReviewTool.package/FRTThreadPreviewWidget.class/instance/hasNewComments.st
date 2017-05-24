accessing
hasNewComments

	^ ((FRTThreadSubscription
		loadWhere: {#user -> self topLevel user. #thread -> self thread}
		populate: #()
		from: self topLevel backend)
			then: [:subscriptions | | subscription |
				subscriptions
					ifNotEmpty: [
						subscription := subscriptions onlyElement.
						subscription lastVisited < latestComment createdAt]
					ifEmpty: [false]])
			catch: [false]