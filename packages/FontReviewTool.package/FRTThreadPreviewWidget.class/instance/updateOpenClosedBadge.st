as yet unclassified
updateOpenClosedBadge

	self thread closed
		ifTrue: [
			openClosedBadge
				text: 'Closed';
				visible: true;
				colorType: #danger]
		ifFalse: [
			openClosedBadge visible: false]