updating
updateClosedBadge

	self thread closed
		ifTrue: [
			closedBadge
				text: 'Closed';
				visible: true;
				colorType: #danger]
		ifFalse: [
			closedBadge visible: false]