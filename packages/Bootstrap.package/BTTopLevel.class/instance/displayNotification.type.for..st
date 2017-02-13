as yet unclassified
displayNotification: aString type: aColorType for: aDuration
	| newNotification |
	newNotification := (BTNotification text: aString type: aColorType)
		displayFor: aDuration
		onDismiss: [ :notification | activeNotifications remove: notification ];
		disableTableLayout: true;
		addTo: self;
		bottomRight: self layoutBounds bottomRight.
	
	activeNotifications
		do: [ :notification | notification y: notification y + newNotification height + (BTWidget spacing / 2) ];
		add: newNotification