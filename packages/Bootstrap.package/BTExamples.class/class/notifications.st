as yet unclassified
notifications
	| toplevel |
	toplevel := BTTopLevel new.
	
	toplevel
		add: (((BTButton label: 'Show notification' icon: #flag)
			when: #clicked evaluate: [ :event | toplevel displayNotification: (BTIcon icon: #life_ring), ' Critical Failure' type: #danger ])).
	
	toplevel displayNotification: 'I''m staying.' type: #success.
	
	[(Delay forSeconds: 2) wait. toplevel displayNotification: ((BTIcon icon: #cloud), ' Hi') type: #warning ] fork.
	
	^toplevel