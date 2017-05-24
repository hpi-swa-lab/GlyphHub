mock-data
mockSubscription

	^ FRTThreadSubscription new
		user: self mockUser;
		thread: self mockThread;
		lastVisited: DateAndTime yesterday - 150000