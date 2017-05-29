updating
updateOpenClosedBadge

	self thread closed
		ifTrue: [
			openClosedBadge
				text: 'Closed';
				visible: true;
				colorType: #danger]
		ifFalse: [
			openClosedBadge visible: false]