callbacks
promiseForThread: aThread

	^ aThread isCreated
		ifFalse: [BTPromise unit: aThread]
		ifTrue: [
			(FRTThread
				load: aThread id
				populate: self threadFields
				from: self backend)].