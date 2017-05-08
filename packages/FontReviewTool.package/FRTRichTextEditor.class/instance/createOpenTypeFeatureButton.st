initialize-release
createOpenTypeFeatureButton

	otFeaturesInput := (BTTextArea placeholder: 'e.g. smcp=on')
		minSize: 200 @ 0;
		when: #confirmed send: #selectedOpenTypeFeatures: to: richText.
	
	^ (BTButton label: 'OT Features')
		attach: (BTPopover new
			add: otFeaturesInput)