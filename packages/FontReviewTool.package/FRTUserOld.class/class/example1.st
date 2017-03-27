as yet unclassified
example1

	^ FRTUserOld new
				username: 'John Doe';
				avatarFromPath: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin.png';
				addTag: 'Engineer';
				addLanguage: 'Hindi' expertiseLevel: 'Beginner';
				addLanguage: 'German' expertiseLevel: 'Native'