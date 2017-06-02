mock-data
mockSubscription

	^ FRTThreadSubscription new
		user: self mockUser;
		thread: self mockThread;
		" a generic timestamp before yesterday "
		lastVisited: DateAndTime yesterday - 150000