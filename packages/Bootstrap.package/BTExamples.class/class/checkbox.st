examples
checkbox

	^ BTTopLevel new
		add: BTCheckbox new;
		add: (BTCheckbox new colorType: #danger);
		add: (BTCheckbox new colorType: #primary);
		add: (BTCheckbox new colorType: #success);
		add: (BTCheckbox new colorType: #info);
		add: (BTCheckbox new colorType: #warning);
		add: (BTCheckboxWithLabel label: 'Check me to win!')