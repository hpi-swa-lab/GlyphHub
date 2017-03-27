as yet unclassified
example1
	^FRTComment new
		isRead: false;
		dateTime: DateAndTime now;
		text: 'The triangle should be a line';
		image: (Form fromFileNamed: (FileDirectory default / 'BP2016H1' / 'notification_sample.png') fullName);
		author: FRTUserOld example1