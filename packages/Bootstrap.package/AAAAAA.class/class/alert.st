as yet unclassified
alert
	^BTTopLevel new
		vertical: true;
		add: (BTAlert text: 'Danger! D:' type: #danger);
		add: (BTAlert text: 'Info! :|' type: #info);
		add: (BTAlert text: 'Warning! :o' type: #warning);
		add: (BTAlert text: 'Success! \o/' type: #success)