as yet unclassified
popover
	| button1 button2 |
	button1 := BTButton label: (BTIcon icon: #medkit), ' Hit me!'.
	BTPopover new
		add: (BTLabel text: 'hi there');
		attachTo: button1.
		
	button2 := BTButton label: (BTIcon icon: #plane), ' Hover me!'.
	BTPopover new
		add: (BTLabel text: 'Bye!');
		hoverAttachTo: button2.  
	
	^BTTopLevel new
		add: button1;
		add: button2