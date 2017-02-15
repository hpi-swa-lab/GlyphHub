as yet unclassified
setUp

	user := FRTUser new
				name: 'John Doe';
				avatarFromPath: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin.png';
				addTag: 'Engineer';
				addLanguage: 'Language1' expertiseLevel: 'Beginner';
				addLanguage: 'Language2' expertiseLevel: 'Native'