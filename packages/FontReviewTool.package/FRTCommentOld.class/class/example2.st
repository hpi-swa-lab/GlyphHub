as yet unclassified
example2
	^FRTCommentOld new
		isRead: false;
		dateTime: DateAndTime now;
		text: 'a comment here';
		image: (Form fromFileNamed: (FileDirectory default / 'BP2016H1' / 'notification_sample.png') fullName);
		author: FRTUserOld example2