examples
disabled

	| topLevel |
	topLevel := BTTopLevel new.

	#(primary secondary info success warning danger) do: [:colorType |
		topLevel
			add: ((BTButton label: 'Hit me!')
				colorType: colorType;
				when: #clicked send: #displayNotification:type: to: topLevel withArguments: #('Got me.' #danger));
			add: ((BTButton label: 'Don''t hit me!')
				colorType: colorType;
				disabled: true;
				when: #clicked send: #displayNotification:type: to: topLevel withArguments: #('Got me.' #danger))].
			
	^ topLevel