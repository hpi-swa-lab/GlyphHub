as yet unclassified
example2

	^ FRTUserOld new
				username: 'Johanna Doe';
				avatarFromPath: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin2.jpg';
				addTag: 'Designer';
				addLanguage: 'Greek' expertiseLevel: 'Beginner';
				addLanguage: 'French' expertiseLevel: 'Native'