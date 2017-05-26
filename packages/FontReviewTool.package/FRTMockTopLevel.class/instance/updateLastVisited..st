operations
updateLastVisited: aThread
"needs to be implemented like this because lastVisited is not supposed to be savable to the server by calling lastVisited:. instead, we set it in here by marking all dirty and then setting saving again."

	^ (FRTThreadSubscription
		loadWhere: {#user -> self user. #thread -> aThread}
		populate: #()
		from: self) then: [:loadedSubscription |
			loadedSubscription
				ifNotEmpty: [
					loadedSubscription onlyElement
						lastVisited: DateAndTime now;
						markAllDirty: true;
						save]
				ifEmpty: [
					BTPromise unit: true]]