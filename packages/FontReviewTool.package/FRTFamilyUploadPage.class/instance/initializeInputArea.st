initialize-release
initializeInputArea

	^ BTScrollArea new
		add: (BTPage column
			add: familyName;
			add: self fileUploadArea;
			add: BTDivider new;
			add: (BTLabel heading: 'While you wait... ');
			add: (BTLabel categoryHeader: 'Write something about your font!');
			add: (aboutFamilyText := ((BTTextArea placeholder: 'Write something about your font')
				multiLine: true;
				minRows: 4;
				when: #changed send: #disabled: to: saveButton with: false));
			add: (BTLabel categoryHeader: 'Or complete your biography!');
			add: (biographyText := ((BTTextArea placeholder: 'Write something about yourself')
				multiLine: true;
				minRows: 4;
				when: #changed send: #disabled: to: saveButton with: false)))