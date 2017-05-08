loading
newThreadSubscription: aThread

	^ FRTThreadSubscription new
		user: self user;
		thread: aThread;
		yourself